import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  final String orderId;

  Success({required this.orderId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Order ID: $orderId",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Image(
                  image: AssetImage("images/success.gif"),
                  width: 300,
                  height: 400,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Payment Successful!",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your order is being prepared!!! \nShow your order number at counter",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 203, 67, 25),
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Return to Home Page",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
