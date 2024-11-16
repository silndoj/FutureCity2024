import 'package:flutter/material.dart';


class PersistentBottomBarScaffold extends StatefulWidget {
  final List<PersistentTabItem> items;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? bottomBarBackgroundColor;

  const PersistentBottomBarScaffold({
    Key? key,
    required this.items,
    this.selectedItemColor, 
    this.unselectedItemColor,
    this.bottomBarBackgroundColor,
  }) : super(key: key);

  @override
  _PersistentBottomBarScaffoldState createState() =>
      _PersistentBottomBarScaffoldState();
}


class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /// Check if curent tab can be popped
        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
          return false;
        } else {
          // if current tab can't be popped then use the root navigator
          return true;
        }
      },
      child: Scaffold(
        /// Using indexedStack to maintain the order of the tabs and the state of the
        /// previously opened tab
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items
              .map((page) => Navigator(
                    /// Each tab is wrapped in a Navigator so that naigation in
                    /// one tab can be independent of the other tabs
                    key: page.navigatorkey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.tab)
                      ];
                    },
                  ))
              .toList(),
        ),

        /// Define the persistent bottom bar
        
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) {
            if (index == _selectedTab) {
              widget.items[index].navigatorkey?.currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _selectedTab = index;
              });
            }
          },
          items: widget.items
              .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.icon), label: item.title))
              .toList(),
          selectedItemColor: widget.selectedItemColor ?? Colors.blue, // Set selected item color
          unselectedItemColor: widget.unselectedItemColor ?? Colors.grey, // Set unselected item color
          backgroundColor: widget.bottomBarBackgroundColor ?? Colors.white, // Set background color
        ),
      ),
    );
  }
}

/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final IconData icon;

  PersistentTabItem(
      {required this.tab,
      this.navigatorkey,
      required this.title,
      required this.icon});
}
