import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  get http => null; //can be used for user(not sure)


  // Future<int> getPaymentVolume() async {
  //   try {
  //     final response = await http.get(
  //         'https://api.razorpay.com/v1/payments?from=1593320020&to=1624856020&count=2&skip=1'); // Replace 'your_api_endpoint' with your actual endpoint
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       return data['payment_volume'];
  //     } else {
  //       print('Failed to fetch payment volume: ${response.statusCode}');
  //       return 0;
  //     }
  //   } catch (e) {
  //     print("Error fetching payment volume: $e");
  //     return 0;
  //   }
  // }

  Future<List<DocumentSnapshot>> getAllUsers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Users').get();
    return querySnapshot.docs;
  }

  Future<List<DocumentSnapshot>> getFoodOrders() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('foodOrders').get();
    return querySnapshot.docs;
  }



  Future<void> addUserDetail(
      Map<String, dynamic> userInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(id)
          .set(userInfoMap);
    } catch (e) {
      print("Error adding user details: $e");
    }
  }

  Future<void> addFoodItem(
      Map<String, dynamic> userInfoMap, String name) async {
    try {
      await FirebaseFirestore.instance.collection(name).add(userInfoMap);
    } catch (e) {
      print("Error adding food item: $e");
    }
  }

  Future<Stream<QuerySnapshot>?> getDisplayedFoodItems(String name) async {
  try {
      return FirebaseFirestore.instance
          .collection(name)
          .where('isDisplayed', isEqualTo: true)
          .snapshots();
    } catch (e) {
      print("Error fetching displayed food items: $e");
      return null;
    }
  }


  Future<Stream<QuerySnapshot>?> getFoodItem(String name) async {
    try {
      return FirebaseFirestore.instance.collection(name).snapshots();
    } catch (e) {
      print("Error fetching food items: $e");
      return null;
    }
  }

  Future<void> addFoodToCart(
      Map<String, dynamic> userInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(id)
          .collection('Cart')
          .add(userInfoMap);
    } catch (e) {
      print("Error adding food to cart: $e");
    }
  }

  Future<Stream<QuerySnapshot>?> getFoodCart(String id) async {
    try {
      return FirebaseFirestore.instance
          .collection("Users")
          .doc(id)
          .collection("Cart")
          .snapshots();
    } catch (e) {
      print("Error fetching food cart: $e");
      return null;
    }
  }

  Future<int> getTotalUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Users').get();
      return querySnapshot.size;
    } catch (e) {
      print("Error fetching total users: $e");
      return 0;
    }
  }

  Future<void> placeOrder(String userId, String orderNumber, int totalAmount,
      List<Map<String, dynamic>> items) async {
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(orderNumber)
          .set({
        'userId': userId,
        'totalAmount': totalAmount,
        'items': items, // Add items array to the order document
        // Add more order details as needed
      });
    } catch (e) {
      print('Error placing order: $e');
      // Handle error accordingly
    }
  }


  //  Future<void> addOrder(String userId, String orderNumber, int totalAmount,
  //     List<Map<String, dynamic>> items, bool isPending) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('Orders')
  //         .doc(orderNumber)
  //         .set({
  //       'userId': userId,
  //       'totalAmount': totalAmount,
  //       'items': items,
  //       'isPending': isPending, // Add the boolean field
  //       'timestamp': DateTime.now(),
  //     });
  //   } catch (e) {
  //     print('Error adding order: $e');
  //     // Handle error accordingly
  //   }
  // }

  Future<int> getOrderCounter() async {
    try {
      DocumentSnapshot counterDoc =
          await FirebaseFirestore.instance.collection('OrderCounter').doc('counter').get();
      int currentCounter = counterDoc.exists ? counterDoc['counter'] : 0;
      return currentCounter;
    } catch (e) {
      print('Error retrieving order counter: $e');
      return 0;
    }
  }

  // Future<void> incrementOrderCounter() async {
  //   try {
  //     await FirebaseFirestore.instance.collection('OrderCounter').doc('counter').update(
  //       {'counter': FieldValue.increment(1)},
  //     );
  //   } catch (e) {
  //     print('Error incrementing order counter: $e');
  //   }
  // }


// Method to get the last order number for a user
    Future<int> getLastOrderNumber(String userId) async {
    try {
      DocumentSnapshot orderCounterDoc = await FirebaseFirestore.instance
          .collection('OrderCounter')
          .doc('counter')
          .get();
      int currentCounter = orderCounterDoc.exists ? orderCounterDoc['counter'] : 0;
      return currentCounter;
    } catch (e) {
      print('Error retrieving last order number: $e');
      throw Exception('Failed to get last order number');
    }
  }
  
  // Method to get the last order number
  // Future<int> getLastOrderNumber() async {
  //   try {
  //     DocumentSnapshot orderCounterDoc = await FirebaseFirestore.instance
  //         .collection('OrderCounter')
  //         .doc('counter')
  //         .get();
  //     int currentCounter = orderCounterDoc.exists ? orderCounterDoc['counter'] : 0;
  //     return currentCounter;
  //   } catch (e) {
  //     print('Error retrieving last order number: $e');
  //     throw Exception('Failed to get last order number');
  //   }
  // }

  // Method to add an order
  Future<void> addOrder(String userId, String orderNumber, int totalAmount,
      List<Map<String, dynamic>> items, bool isPending) async {
    try {
      await FirebaseFirestore.instance
          .collection('Orders')
          .doc(orderNumber)
          .set({
        'userId': userId,
        'totalAmount': totalAmount,
        'items': items,
        'isPending': isPending,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error adding order: $e');
      // Handle error accordingly
    }
  }

  // Method to increment the order counter
  Future<void> incrementOrderCounter() async {
    try {
      await FirebaseFirestore.instance.collection('OrderCounter').doc('counter').update(
        {'counter': FieldValue.increment(1)},
      );
    } catch (e) {
      print('Error incrementing order counter: $e');
    }
  }


  //  Future<Stream<QuerySnapshot>?> getOrders(String name) async {
  //   try {
  //     return FirebaseFirestore.instance.collection(name).snapshots();
  //   } catch (e) {
  //     print("Error fetching food items: $e");
  //     return null;
  //   }
  // }


}
