import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Two tabs: City and Friends
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          // Tabs for switching between leaderboards
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blueAccent,
            tabs: const [
              Tab(text: 'City Leaderboard'), // First Tab
              Tab(text: 'Friends Leaderboard'), // Second Tab
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                leaderboardList(cityLeaderboardData), // City Leaderboard
                leaderboardList(friendsLeaderboardData), // Friends Leaderboard
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Leaderboard',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

Widget leaderboardList(List<Map<String, String>> data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      final player = data[index];
      
      // Colors for the top three places
      final placeColors = [
        Colors.amber.shade300, // Gold for 1st place
        Colors.grey.shade300, // Silver for 2nd place
        Colors.brown.shade300, // Bronze for 3rd place
      ];

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: index < 3 ? placeColors[index] : Colors.white, // Highlight top 3
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(player['image'] ?? 'assets/images/default_profile.png'), // Image Path
          ),
          title: Text(
            player['name'] ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: index < 3 ? Colors.black : Colors.black87, // Darker text for contrast
            ),
          ),
          subtitle: Text(
            'Points: ${player['score']}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: index == 0
                    ? Colors.amber // Gold star for 1st place
                    : index == 1
                        ? Colors.grey // Silver star for 2nd place
                        : index == 2
                            ? Colors.brown // Bronze star for 3rd place
                            : Colors.black26, // Default for others
                size: 20,
              ),
              const SizedBox(width: 5), // Space between the star and the rank
              Text(
                player['rank'] ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
  // Sample data for City Leaderboard
  final List<Map<String, String>> cityLeaderboardData = const [
    {'rank': '1', 'name': 'hans_müller', 'score': '1450', 'image': 'assets/images/1.jpg'},
    {'rank': '2', 'name': 'silvestri_42heilbronn', 'score': '1400', 'image': 'assets/images/silvi.jpg'},
    {'rank': '3', 'name': 'peter_1wagner', 'score': '1350', 'image': 'assets/images/10.jpg'},
    {'rank': '4', 'name': 'sophie_fischer', 'score': '1300', 'image': 'assets/images/4.jpg'},
    {'rank': '5', 'name': 'lukas_weber', 'score': '1250', 'image': 'assets/images/5.jpg'},
    {'rank': '6', 'name': 'emil_42heilbronn', 'score': '1225', 'image': 'assets/images/emil.jpg'},
    {'rank': '7', 'name': 'maria_lehmann', 'score': '1200', 'image': 'assets/images/06.jpg'},
    {'rank': '8', 'name': 'paul_koch', 'score': '1150', 'image': 'assets/images/7.jpg'},
    {'rank': '9', 'name': 'laura_klein', 'score': '1100', 'image': 'assets/images/9.jpg'},
    {'rank': '10', 'name': 'max_schulz', 'score': '1050', 'image': 'assets/images/8.jpg'},
    {'rank': '11', 'name': 'emma_bauer', 'score': '1000', 'image': 'assets/images/11.jpg'},
    {'rank': '12', 'name': 'anna_schmidt23', 'score': '800', 'image': 'assets/images/02.jpg'},
  ];

  // Sample`` data for Friends Leaderboard
  final List<Map<String, String>> friendsLeaderboardData = const [
    {'rank': '1', 'name': 'silvestri_42heilbronn', 'score': '1400', 'image': 'assets/images/silvi.jpg'},
    {'rank': '2', 'name': 'emil_42heilbronn', 'score': '1225', 'image': 'assets/images/emil.jpg'},
  ];
}

