import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/routes/route_names.dart';

class RegisterOtp extends StatelessWidget {
  const RegisterOtp({super.key});

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
          'Register Otp',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      )),
    );
  }
}
