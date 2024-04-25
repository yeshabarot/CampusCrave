// adminpanel.dart

import 'package:campuscrave/services/database.dart';
import 'package:flutter/material.dart';

class AdminPanelScreen extends StatefulWidget {
  @override
  _AdminPanelScreenState createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  DatabaseMethods _databaseMethods = DatabaseMethods();
  int totalUsers = 0;

  @override
  void initState() {
    super.initState();
    fetchTotalUsers();
  }

  Future<void> fetchTotalUsers() async {
    int usersCount = await _databaseMethods.getTotalUsers();
    setState(() {
      totalUsers = usersCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total Users: $totalUsers',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Add other admin functionalities here
          ],
        ),
      ),
    );
  }
}
