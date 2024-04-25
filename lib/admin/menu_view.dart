import 'package:campuscrave/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuViewPage extends StatefulWidget {
  const MenuViewPage({Key? key}) : super(key: key);

  @override
  _MenuViewPageState createState() => _MenuViewPageState();
}

class _MenuViewPageState extends State<MenuViewPage> {
  final DatabaseMethods _databaseMethods = DatabaseMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Menu' ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategorySection(category: 'Pizza'),
            CategorySection(category: 'Burger'),
            CategorySection(category: 'Ice Cream'),
            CategorySection(category: 'Salad'),
          ],
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String category;

  const CategorySection({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection(category).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            final List<QueryDocumentSnapshot> foodItems = snapshot.data!.docs;
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final foodItem = foodItems[index];
                return ListTile(
                  title: Text(foodItem['Name']), // Update field name here
                  subtitle: Text('Price: \$${foodItem['Price']}'), // Update field name here
                );
              },
            );
          },
        ),
      ],
    );
  }
}
