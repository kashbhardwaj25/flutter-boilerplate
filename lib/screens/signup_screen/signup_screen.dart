import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taskaide'),
      ),
      body: const Center(
        child: Text('Register for your account!'),
      ),
    );
  }
}
