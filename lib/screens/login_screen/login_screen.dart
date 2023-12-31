import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/routes/route_names.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.register,
          );
        },
        child: const Text(
          'Create Account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      )),
    );
  }
}
