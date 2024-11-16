import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_friend.dart';
import 'persistent_bottom_bar_scaffold.dart';

class HomePage extends StatelessWidget {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();
  final _tab4navigatorKey = GlobalKey<NavigatorState>();
  final _tab5navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: TabPage1(),
          icon: Icons.home,
          title: 'Home',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: AddFriend(),
          icon: Icons.task,
          title: 'Tasks',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage4(),
          icon: Icons.card_giftcard,
          title: 'Rewards',
          navigatorkey: _tab4navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage5(),
          icon: Icons.leaderboard,
          title: 'Leaderboard',
          navigatorkey: _tab5navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage3(),
          icon: Icons.person,
          title: 'Profile',
          navigatorkey: _tab3navigatorKey,
        ),
      ],
      selectedItemColor: Colors.blue, // Customize the selected item color
      unselectedItemColor: Colors.grey, // Customize the unselected item color
      bottomBarBackgroundColor: Colors.white,
    );
  }
}

class TabPage1 extends StatelessWidget {
  const TabPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('TabPage1 build');
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}

class TabPage2 extends StatelessWidget {
  const TabPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: Center(
        child: Text('Tasks Page Content'),
      ),
    );
  }
}

class TabPage3 extends StatelessWidget {
  const TabPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Text('Profile Page Content'),
      ),
    );
  }
}

class TabPage4 extends StatelessWidget {
  const TabPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rewards')),
      body: Center(
        child: Text('Rewards Page Content'),
      ),
    );
  }
}

class TabPage5 extends StatelessWidget {
  const TabPage5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: Center(
        child: Text('Leaderboard Page Content'),
      ),
    );
  }
}
