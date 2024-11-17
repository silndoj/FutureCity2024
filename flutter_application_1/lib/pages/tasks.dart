
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
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              color: Colors.blueAccent,  // Set a solid color indicator
              borderRadius: BorderRadius.circular(20),
            ),
            tabs: [
              _buildTab('Community', taskData['Community']!),
              _buildTab('Weekly Tasks', taskData['Weekly Tasks']!),
            ],
          ),

          // Task Lists in Tabs
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                taskListWidget('Community'),
                taskListWidget('Weekly Tasks'),
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

  Widget _buildTab(String title, List<Map<String, dynamic>> tasks) {
    final completedTasks = tasks.where((task) => task['status'] == 'Completed').length;
    return Tab(
      child: Column(
        children: [
          Text(title),
          if (tasks.isNotEmpty)
            Text(
              '$completedTasks/${tasks.length}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
        ],
      ),
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
          description: task['description'],
          status: task['status'],
          goal: task['goal'],
          currentProgress: task['currentProgress'],
          onStatusChange: () => _updateTaskStatus(category, index),
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
    required VoidCallback onStatusChange,
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
          leading: CircleAvatar(
            backgroundColor: statusColor.withOpacity(0.1),
            child: Icon(
              statusIcon,
              color: statusColor,
            ),
          ),
          title: Text(
            '$title - ${currentProgress}/${goal}', // Show current progress and goal
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          trailing: ElevatedButton(
            onPressed: status == 'Completed' ? null : onStatusChange,
            style: ElevatedButton.styleFrom(
              backgroundColor: statusColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              status == 'Completed' ? 'Done' : 'Complete',
              style: TextStyle(color: statusColor),
            ),
          ),
        ),
      ),
    );
  }

  void _updateTaskStatus(String category, int index) {
    setState(() {
      taskData[category]![index]['status'] = 'Completed';
    });
  }

  // Weekly Tasks
  List<Map<String, dynamic>> _getWeeklyTasks() => [
    {'name': 'Walk 10,000 Steps', 'description': 'Walk 10,000 steps today to stay active and healthy.', 'status': 'Pending', 'goal': 10000, 'currentProgress': 0},
    {'name': 'Bike 20km in Heilbronn', 'description': 'Cycle 20 kilometers in the city using your bike or public bike share service.', 'status': 'Pending', 'goal': 20, 'currentProgress': 0},
    {'name': 'Use an E-Scooter for 5km', 'description': 'Use a shared e-scooter for at least 5 kilometers in the city.', 'status': 'Pending', 'goal': 5, 'currentProgress': 0},
    // More tasks can be added here
  ];

  // Community Tasks
  List<Map<String, dynamic>> _getCommunityTasks() => [
    {'name': 'Join a Local Sports Club', 'description': 'Become a member of a sports club in Heilbronn for regular activities.', 'status': 'Pending', 'goal': 1, 'currentProgress': 0},
    {'name': 'Attend a City Hall Meeting (Rathaus)', 'description': 'Participate in a public meeting to engage with city officials and learn about local projects.', 'status': 'Pending', 'goal': 1, 'currentProgress': 0},
    {'name': 'Sign Up for a Local Environmental Group', 'description': 'Join a community group focused on sustainability and environmental preservation in Heilbronn.', 'status': 'Pending', 'goal': 1, 'currentProgress': 0},
    // More tasks can be added here
  ];
}

