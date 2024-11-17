import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_friend.dart';
import 'package:flutter_application_1/pages/leaderboard.dart';
import 'persistent_bottom_bar_scaffold.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // Upper half: Profile, level, and currency
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0), // Reduced padding
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 60, // Reduced size of avatar
                        backgroundImage: AssetImage('assets/icons/silv_pfpi.jpeg'),
                      ),
                      SizedBox(height: 8), // Reduced space
                      Text(
                        'silvestri_42heilbronn',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), // Reduced font size
                      ),
                      SizedBox(height: 6), // Reduced space
                      Text(
                        'Level 5',
                        style: TextStyle(fontSize: 16, color: Colors.grey), // Reduced font size
                      ),
                      SizedBox(height: 12), // Reduced space
                      LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      SizedBox(height: 6), // Reduced space
                      Text(
                        '60% to next level',
                        style: TextStyle(fontSize: 14, color: Colors.grey), // Reduced font size
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0), // Reduced padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Reduced font size
                    ),
                    ListTile(
                      leading: Icon(Icons.emoji_events, size: 20), // Reduced icon size
                      title: Text('Completed a level 5 challenge', style: TextStyle(fontSize: 14)), // Reduced font size
                    ),
                    ListTile(
                      leading: Icon(Icons.star, size: 20), // Reduced icon size
                      title: Text('Received 10 mobility points', style: TextStyle(fontSize: 14)), // Reduced font size
                    ),
                    SizedBox(height: 12), // Reduced space
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AchievementsPage(),
                              ),
                            );
                          },
                          child: Text('Achievements', style: TextStyle(fontSize: 14)), // Reduced font size
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40), // Reduced height
                          ),
                        ),
                        SizedBox(height: 8), // Reduced space
                        ElevatedButton(
                          onPressed: () {
                            _showCarbonFootprintDialog(context); // Show Carbon Footprint Dialog
                          },
                          child: Text('Carbon Footprint', style: TextStyle(fontSize: 14)), // Reduced font size
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40), // Reduced height
                          ),
                        ),
                        SizedBox(height: 8), // Reduced space
                        ElevatedButton(
                          onPressed: () {
                            _showStatsDialog(context); // Show Stats Dialog
                          },
                          child: Text('Stats', style: TextStyle(fontSize: 14)), // Reduced font size
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40), // Reduced height
                          ),
                        ),
                        SizedBox(height: 8), // Reduced space
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyTripsPage(),
                              ),
                            );
                          },
                          child: Text('My Trips', style: TextStyle(fontSize: 14)), // Reduced font size
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 40), // Reduced height
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the Carbon Footprint dialog
  void _showCarbonFootprintDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Carbon Footprint Reduction'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Since switching to eco-friendly travel, you have reduced your carbon footprint by:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• 76 kg CO₂ in the past month',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• 6754 kg CO₂ since starting eco-friendly travel',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Keep it up! Every small change counts.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show the Stats dialog
  void _showStatsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Stats'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Here are your stats so far:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Quests Completed: 78',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Steps Taken: 233,743',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Experience Points Earned: 1,250',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Mobility Points Collected: 748',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Total Distance Travelled: 965 km',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Great job! Keep up the eco-friendly habits!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

// MyTripsPage: A dedicated page for trips
class MyTripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Trips'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildTrip(
            transport: 'Bus',
            distance: 4.5,
            city: 'Heilbronn',
            destination: 'Main Train Station',
          ),
          SizedBox(height: 12),
          _buildTrip(
            transport: 'Tram',
            distance: 2.8,
            city: 'Heilbronn',
            destination: 'City Center',
          ),
          SizedBox(height: 12),
          _buildTrip(
            transport: 'E-Bike',
            distance: 8.3,
            city: 'Heilbronn',
            destination: 'Böllinger Höfe',
          ),
          SizedBox(height: 12),
          _buildTrip(
            transport: 'Walking',
            distance: 1.2,
            city: 'Heilbronn',
            destination: 'Kilianskirche',
          ),
          SizedBox(height: 12),
          _buildTrip(
            transport: 'Scooter',
            distance: 3.5,
            city: 'Heilbronn',
            destination: 'Stadtpark',
          ),
          SizedBox(height: 12),
          _buildTrip(
            transport: 'Bike',
            distance: 7.0,
            city: 'Heilbronn',
            destination: 'Neckar River',
          ),
        ],
      ),
    );
  }

  // Helper widget to build each trip
  Widget _buildTrip({
    required String transport,
    required double distance,
    required String city,
    required String destination,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              _getTransportIcon(transport),
              size: 40,
              color: Colors.blue,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$transport to $destination',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'City: $city',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  'Distance: $distance km',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to return the right transport icon
  IconData _getTransportIcon(String transport) {
    switch (transport) {
      case 'Bus':
        return Icons.directions_bus;
      case 'Tram':
        return Icons.directions_subway;
      case 'E-Bike':
        return Icons.electric_bike;
      case 'Walking':
        return Icons.directions_walk;
      case 'Scooter':
        return Icons.motorcycle;
      case 'Bike':
        return Icons.directions_bike;
      default:
        return Icons.directions_walk;
    }
  }
}

// AchievementsPage: New Page for Achievements
class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildAchievement(
            icon: Icons.directions_bike,
            title: 'Green Traveler',
            description: 'Travelled 50 km using eco-friendly transport',
            isUnlocked: true,
          ),
          SizedBox(height: 12),
          _buildAchievement(
            icon: Icons.emoji_events,
            title: 'Quest Completer',
            description: 'Completed 10 eco-friendly challenges',
            isUnlocked: true,
          ),
          SizedBox(height: 12),
          _buildAchievement(
            icon: Icons.check_circle,
            title: 'Fitness Fanatic',
            description: 'Walked 50,000 steps',
            isUnlocked: true,
          ),
          SizedBox(height: 12),
          _buildAchievement(
            icon: Icons.eco,
            title: 'Zero Waste Traveler',
            description: 'Completed 5 trips with zero waste',
            isUnlocked: true,
          ),
          SizedBox(height: 12),
          _buildAchievement(
            icon: Icons.lock,
            title: 'Master Recycler',
            description: 'Recycled 100 kg of waste',
            isUnlocked: false,
          ),
          SizedBox(height: 12),
          _buildAchievement(
            icon: Icons.lock,
            title: 'Carbon Footprint King',
            description: 'Reduced 500 kg CO₂',
            isUnlocked: false,
          ),
          SizedBox(height: 12),
          _buildAchievement(
            icon: Icons.lock,
            title: 'Eco-Warrior',
            description: 'Completed 20 eco-friendly challenges',
            isUnlocked: false,
          ),
          SizedBox(height: 12),
          _buildAchievement(
            icon: Icons.lock,
            title: 'Sustainable Traveler',
            description: 'Traveled eco-friendly for 1 month',
            isUnlocked: false,
          ),
        ],
      ),
    );
  }

  // Helper widget to build each achievement
  Widget _buildAchievement({
    required IconData icon,
    required String title,
    required String description,
    required bool isUnlocked,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: isUnlocked ? Colors.green : Colors.grey,
          size: 40,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isUnlocked ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: isUnlocked ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


  // Function to show the Carbon Footprint dialog
  void _showCarbonFootprintDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Carbon Footprint Reduction'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Since switching to eco-friendly travel, you have reduced your carbon footprint by:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• 76 kg CO₂ in the past month',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• 6754 kg CO₂ since starting eco-friendly travel',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Keep it up! Every small change counts.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show the Stats dialog
  void _showStatsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Stats'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Here are your stats so far:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '• Quests Completed: 78',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Steps Taken: 233,743',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Experience Points Earned: 1,250',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Mobility Points Collected: 748',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '• Total Distance Travelled: 965 km',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Great job! Keep up the eco-friendly habits!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }