import 'package:flutter/material.dart';
import 'services/login_screen.dart';
import 'services/signup_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/splash_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
