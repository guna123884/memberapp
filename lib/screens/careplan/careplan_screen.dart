import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';

class CareplanScreen extends StatelessWidget {
  const CareplanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Care Plan')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          },
          child: Text('Go to Login'),
        ),
      ),
    );
  }
}
