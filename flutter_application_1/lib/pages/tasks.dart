
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Map<String, List<Map<String, dynamic>>> taskData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Community & Weekly Tasks
    taskData = {
      'Community': _getCommunityTasks(),
      'Weekly Tasks': _getWeeklyTasks(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          // Tab Bar
          TabBar(
            controller: _tabController,
            labelColor: Colors.red, // Selected category color
            unselectedLabelColor: Colors.grey, // Unselected category color
            indicatorColor: Colors.red, // Indicator color: Red
            tabs: const [
              Tab(text: 'Weekly Tasks'), // Second Tab
              Tab(text: 'Community'), // First Tab
            ],
          ),

          // Task Lists in Tabs
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                taskListWidget('Weekly Tasks'),
                taskListWidget('Community'),
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
        'Tasks',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget taskListWidget(String category) {
    final tasks = taskData[category]!;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return taskCard(
          title: task['name'],
          status: task['status'],
          goal: task['goal'],
          currentProgress: task['currentProgress'],
          xpPoints: task['xpPoints'],
          mobilityCoins: task['mobilityCoins'],
          description: task['description'], // Pass description for the bottom sheet
        );
      },
    );
  }




Widget taskCard({
  required String title,
  required String description,
  required String status,
  required int goal,
  required int currentProgress,
  required int xpPoints,
  required int mobilityCoins,
}) {
  // Define task colors
  Color taskColor = status == 'Completed' ? Colors.green : Colors.white;
  Color statusColor = status == 'Completed' ? Colors.green : Colors.grey;
  IconData statusIcon = status == 'Completed' ? Icons.check_circle : Icons.schedule;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        color: taskColor, // Use taskColor instead of gradient
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
        leading: status == 'Completed' 
          ? CircleAvatar(
              backgroundColor: statusColor.withOpacity(0.1),
              child: Icon(
                statusIcon,
                color: statusColor,
              ),
            )
          : null, // No icon for Pending tasks
        title: Row(
          children: [
            Expanded(
              child: Text(
                '$title - ${currentProgress}/${goal}', // Show current progress and goal
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            // Display XP Points and Mobility Coins next to the title
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // XP Points with Fancy Style
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow.shade700, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      '+$xpPoints XP', 
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Mobility Coins with Fancy Style
                Row(
                  children: [
                    Icon(Icons.bike_scooter, color: Colors.red.shade700, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      '+$mobilityCoins', 
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          // Show the description in a bottom sheet when the task is tapped
          _showDescriptionBottomSheet(context, description);
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // XP Points and Mobility Coins (Only visible for completed tasks)
            if (status == 'Completed') ...[
              // XP Points Icon and Label
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow.shade700, size: 18),
                  const SizedBox(width: 5),
                  Text(
                    '$xpPoints XP',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              // Mobility Coins Icon and Label
              Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.blue.shade700, size: 18),
                  const SizedBox(width: 5),
                  Text(
                    '$mobilityCoins Coins',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
            // Checkmark Icon (Replaces the Complete button)
            if (status == 'Completed') 
              Icon(Icons.check_circle, color: Colors.green, size: 30),
          ],
        ),
      ),
    ),
  );
}




  // Function to show a modal bottom sheet for task description
  void _showDescriptionBottomSheet(BuildContext context, String description) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Task Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getTaskHighlightColor(int index) {
    if (index == 0) {
      return Colors.amber.shade600; // Gold for 1st
    } else if (index == 1) {
      return Colors.grey.shade400; // Silver for 2nd
    } else if (index == 2) {
      return Colors.brown.shade400; // Bronze for 3rd
    } else {
      return Colors.white; // No highlight for others
    }
  }

  // Weekly Tasks
  List<Map<String, dynamic>> _getWeeklyTasks() => [
    {'name': 'Walk 10,000 Steps', 'description': 'Walk 10,000 steps today.', 'status': 'Pending', 'goal': 10000, 'currentProgress': 0, 'xpPoints': 50, 'mobilityCoins': 20},
    {'name': 'Bike 20km in Heilbronn', 'description': 'Cycle 20km in the city.', 'status': 'Pending', 'goal': 20, 'currentProgress': 0, 'xpPoints': 100, 'mobilityCoins': 40},
    {'name': 'Use an E-Scooter for 5km', 'description': 'Ride an e-scooter for 5km.', 'status': 'Pending', 'goal': 5, 'currentProgress': 0, 'xpPoints': 30, 'mobilityCoins': 10},
    {'name': 'Run 5km in the Park', 'description': 'Run 5km in the the Wertwisen-park.', 'status': 'Pending', 'goal': 5, 'currentProgress': 0, 'xpPoints': 60, 'mobilityCoins': 25},
    {'name': 'Take the Bus', 'description': 'Take the Bus 10 times in 1 week', 'status': 'Pending', 'goal': 10, 'currentProgress': 0, 'xpPoints': 40, 'mobilityCoins': 15},
    
    // Bonus Tasks
    {'name': 'BONUS Challenge', 'description': 'Complete 5 weekly tasks.', 'status': 'Pending', 'goal': 5, 'currentProgress': 0, 'xpPoints': 200, 'mobilityCoins': 100},
  ];

  // Community Tasks
  List<Map<String, dynamic>> _getCommunityTasks() => [
    {'name': 'Join a Local Sports Club', 'description': 'Become a member of a local sports club in Heilbronn.', 'status': 'Pending', 'goal': 1, 'currentProgress': 0, 'xpPoints': 150, 'mobilityCoins': 50},
    {'name': 'Attend a Neighborhood Clean-up', 'description': 'Join a neighborhood cleanup event.', 'status': 'Pending', 'goal': 1, 'currentProgress': 0, 'xpPoints': 150, 'mobilityCoins': 60},
    {'name': 'Support a Local Farmer\'s Market', 'description': 'Visit and support the local market.', 'status': 'Pending', 'goal': 1, 'currentProgress': 0, 'xpPoints': 80, 'mobilityCoins': 30},
    {'name': 'Help Build a Community Garden', 'description': 'Volunteer for a community garden.', 'status': 'Pending', 'goal': 1, 'currentProgress': 0, 'xpPoints': 130, 'mobilityCoins': 50},
    {'name': 'Become a Local Mentor', 'description': 'Offer mentoring to youth.', 'status': 'Pending', 'goal': 1, 'currentProgress': 0, 'xpPoints': 200, 'mobilityCoins': 70},
    
    // Bonus Tasks
    {'name': 'BONUS Challenge', 'description': 'Complete 5 community tasks.', 'status': 'Pending', 'goal': 5, 'currentProgress': 0, 'xpPoints': 250, 'mobilityCoins': 100},
  ];
}

