import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AdminOrdersPage extends StatefulWidget {
  @override
  _AdminOrdersPageState createState() => _AdminOrdersPageState();
}

class _AdminOrdersPageState extends State<AdminOrdersPage> {
  late DatabaseReference _orderRef;
  List<String> orders = [];

  @override
  void initState() {
    super.initState();
    _orderRef = FirebaseDatabase.instance.reference().child('orders');
    _orderRef.onChildAdded.listen((event) {
      setState(() {
        orders.add(event.snapshot.key!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Order Number: ${orders[index]}'),
          );
        },
      ),
    );
  }
}
