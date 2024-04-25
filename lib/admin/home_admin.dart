import 'package:campuscrave/admin/add_food.dart';
import 'package:campuscrave/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Dashboard",
                  style: AppWidget.HeadTextFieldStyle(),
                ),
              ),
              const SizedBox(height: 50.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddFood()),
                  );
                },
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              "images/food.jpg",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          const Text(
                            "+ Add Food Items",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.only(top: 12.0),
                itemCount: _dashboardItem.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle the tap event here
                      print('Tapped item at index $index');
                      // You can navigate to a new screen or perform any other action
                    },
                    child: _buildGridItem(
                      _dashboardItem[index]['title'],
                      _dashboardItem[index]['Subtitle'],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(String title, String subtitle) {
    return Card(
      child: Material(
        elevation: 15.0,
        child: Container(
          color: Color.fromARGB(255, 46, 85, 203).withOpacity(0.85),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static final List<Map<String, dynamic>> _dashboardItem = [
    {
      "title": "46",
      "Subtitle": "Users",
    },
    {
      "title": "5",
      "Subtitle": "Categories",
    },
    {
      "title": "120",
      "Subtitle": "Product",
    },
    {
      "title": "\$600",
      "Subtitle": "Earning",
    },
  ];
}
