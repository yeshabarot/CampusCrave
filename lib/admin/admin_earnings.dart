// import 'package:flutter/material.dart';
// import 'package:campuscrave/services/database.dart'; // Import your database functions

// class TotalEarningsPage extends StatefulWidget {
//   @override
//   _TotalEarningsPageState createState() => _TotalEarningsPageState();
// }

// class _TotalEarningsPageState extends State<TotalEarningsPage> {
//   double totalEarnings = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     fetchTotalEarnings();
//   }

//   void fetchTotalEarnings() async {
//     double earnings = await DatabaseMethods.getPaymentVolume();
//     setState(() {
//       totalEarnings = earnings;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Total Earnings'),
//       ),
//       body: Center(
//         child: Text(
//           'Total Earnings: \$${totalEarnings.toStringAsFixed(2)}',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
