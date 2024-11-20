import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  final List<Map<String, String>> cardData = [
    {
      'title': 'Sales',
      'value': '1,234',
      'icon': '📊',
      'details': 'View sales performance'
    },
    {
      'title': 'Notifications',
      'value': '67',
      'icon': '🔔',
      'details': 'View all notifications'
    },
    {
      'title': 'Revenue',
      'value': '\$2,500',
      'icon': '💵',
      'details': 'View revenue report'
    },
    {
      'title': 'Tasks',
      'value': '15',
      'icon': '📅',
      'details': 'View task list'
    },
    {
      'title': 'Messages',
      'value': '8',
      'icon': '✉️',
      'details': 'Check your messages'
    },
    {
      'title': 'Users',
      'value': '1,200',
      'icon': '👥',
      'details': 'Manage users'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: cardData.length,
          itemBuilder: (context, index) {
            return DashboardCard(
              title: cardData[index]['title']!,
              value: cardData[index]['value']!,
              icon: cardData[index]['icon']!,
              details: cardData[index]['details']!,
            );
          },
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  final String details;

  const DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(details),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                icon,
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
