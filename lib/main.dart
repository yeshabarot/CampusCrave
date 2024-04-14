import 'package:campuscrave/admin/admin_login.dart';
import 'package:campuscrave/firebase_options.dart';
import 'package:campuscrave/screens/login_screen.dart';
import 'package:campuscrave/screens/signin_screen.dart';
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
    return const MaterialApp(home: LoginScreen());
  }
}
