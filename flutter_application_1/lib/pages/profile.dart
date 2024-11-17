import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_friend.dart';



class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {'title': 'Change Profile Details', 'icon': Icons.edit, 'onTap': () {}},
      {'title': 'My Rewards', 'icon': Icons.card_giftcard, 'onTap': () {}},
      {'title': 'Settings', 'icon': Icons.settings, 'onTap': () {}},
      {'title': 'Help', 'icon': Icons.help_outline, 'onTap': () {}},
      {'title': 'Privacy Policy', 'icon': Icons.privacy_tip, 'onTap': () {}},
      {'title': 'Terms & Conditions', 'icon': Icons.article, 'onTap': () {}},
      {'title': 'About', 'icon': Icons.info_outline, 'onTap': () {}},
      {'title': 'Log Out', 'icon': Icons.logout, 'onTap': () {}},
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddFriend()),
              );
            },
            tooltip: 'Add Friend',
          ),
        ],
      ),
      body: Column(
        children: [
          // Larger Profile Picture and Welcome Message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            color: Colors.red.shade100,
            child: Column(
              children: [
                // Circular Profile Picture
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/icons/silv_pfpi.jpeg'), // Replace with the path to your profile image
                ),
                SizedBox(height: 16),
                // Welcome Message
                Text(
                  'Welcome, Sivestri!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                ),
                Text(
                  'Good to see you here!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // List of Options
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                return ListTile(
                  leading: Icon(option['icon'], color: Colors.red),
                  title: Text(option['title']),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: option['onTap'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
