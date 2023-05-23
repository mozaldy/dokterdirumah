import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  final String title;
  const AuthLogo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.local_hospital,
          size: 150,
          color: Colors.red,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 2),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

const primaryColor = Colors.red;
const backgroundColor = Colors.white;
var secondaryColor = Colors.red[100];
