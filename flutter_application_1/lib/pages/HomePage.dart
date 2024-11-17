import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/leaderboard.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/tasks.dart';
import 'package:flutter_application_1/pages/rewards.dart';
import 'package:flutter_application_1/pages/profile.dart';
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
          tab: TasksPage(),
          icon: Icons.task,
          title: 'Tasks',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: Rewards(),
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
          tab: Profile(),
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
