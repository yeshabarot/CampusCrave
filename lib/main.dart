import 'package:campuscrave/constants/colors.dart';
import 'package:campuscrave/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:campuscrave/data/repositories/authentication_repository.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


// class DatabaseMethods {
//   // Define other methods in your DatabaseMethods class

//   Future<void> updateFoodCartQuantity(
//       String userId, String itemId, int quantity) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userId)
//           .collection('foodCart')
//           .doc(itemId)
//           .update({
//         'Quantity': quantity,
//       });
//     } catch (e) {
//       print('Error updating quantity: $e');
//     }
//   }
// }

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // initializing local storage
  await GetStorage.init();

  // native Splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Scaffold(
          backgroundColor: CCcolors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}


