import 'package:campuscrave/admin/add_food.dart';
import 'package:campuscrave/admin/home_admin.dart';
import 'package:campuscrave/firebase_options.dart';
import 'package:campuscrave/pages/bottomnav.dart';
import 'package:campuscrave/pages/home.dart';
import 'package:campuscrave/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WelcomeScreen());
  }
}
