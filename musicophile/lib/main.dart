import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musicophile/HomeScreen.dart';
import 'package:musicophile/screens/EmailVerificationPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/verifyEmail': (context) => const EmailVerificationPage(),
      }
    );
  }
}

