import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_friend.dart';
import 'package:flutter_application_1/pages/leaderboard.dart';
import 'package:flutter_application_1/pages/home.dart';
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
          tab: Home(),
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
          tab: Leaderboard(),
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
      selectedItemColor: Colors.red, // Customize the selected item color
      unselectedItemColor: Colors.black, // Customize the unselected item color
      bottomBarBackgroundColor: Colors.white,
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