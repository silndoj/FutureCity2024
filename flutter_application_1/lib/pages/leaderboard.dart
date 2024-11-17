
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Map<String, List<Map<String, dynamic>>> leaderboardData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Two tabs: City and Friends
    leaderboardData = {
      'City Leaderboard': _getCityLeaderboardData(),
      'Friends Leaderboard': _getFriendsLeaderboardData(),
    };
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
            labelColor: Colors.red, // Selected category color: Red
            unselectedLabelColor: Colors.grey, // Unselected category color: Grey
            indicatorColor: Colors.red, // Indicator color: Red
            tabs: const [
              Tab(text: 'City Leaderboard'), // First Tab
              Tab(text: 'Friends Leaderboard'), // Second Tab
            ],
          ),
          // TabBarView for content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                leaderboardListWidget('City Leaderboard'), // City Leaderboard
                leaderboardListWidget('Friends Leaderboard'), // Friends Leaderboard
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

  Widget leaderboardListWidget(String category) {
    final players = leaderboardData[category]!;
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        return leaderboardCard(
          rank: player['rank'],
          name: player['name'],
          score: player['score'],
          image: player['image'],
          isTopThree: index < 3,
          highlightColor: _getHighlightColor(index),
        );
      },
    );
  }


Widget leaderboardCard({
  required String rank,
  required String name,
  required String score,
  required String image,
  required bool isTopThree,
  required Color highlightColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        color: isTopThree ? highlightColor : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(image),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          'Points: $score',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (rank == '1')
              Icon(Icons.emoji_events, color: Colors.amber.shade600, size: 18), // Gold medal
            if (rank == '2')
              Icon(Icons.emoji_events, color: Colors.grey.shade400, size: 18), // Silver medal
            if (rank == '3')
              Icon(Icons.emoji_events, color: Colors.brown.shade400, size: 18), // Bronze medal
            if (int.tryParse(rank) == null || int.parse(rank) > 3) ...[
              Icon(
                Icons.star,
                color: isTopThree ? highlightColor : Colors.black26,
                size: 20,
              ),
              const SizedBox(width: 5),
            ],
            Text(
              rank,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  Color _getHighlightColor(int index) {
    switch (index) {
      case 0:
        return Colors.amber.shade300; // Gold for 1st
      case 1:
        return Colors.grey.shade300; // Silver for 2nd
      case 2:
        return Colors.brown.shade300; // Bronze for 3rd
      default:
        return Colors.white; // No highlight for others
    }
  }

  // City Leaderboard Data
  List<Map<String, dynamic>> _getCityLeaderboardData() => const [
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

  // Friends Leaderboard Data
  List<Map<String, dynamic>> _getFriendsLeaderboardData() => const [
    {'rank': '1', 'name': 'silvestri_42heilbronn', 'score': '1400', 'image': 'assets/images/silvi.jpg'},
    {'rank': '2', 'name': 'emil_42heilbronn', 'score': '1225', 'image': 'assets/images/emil.jpg'},
  ];
}

