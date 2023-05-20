import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/textinput.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            userWelcome(user),
            const SizedBox(height: 16),
            CustomButtom(
                buttonColor: Colors.red,
                textColor: Colors.white,
                text: 'Logout',
                onPress: () {
                  FirebaseAuth.instance.signOut();
                  // Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  Widget userWelcome(user) {
    if (user != null) {
  
      return Text('Selamat datang, ${user.email}');
    } else {
      return Text('Selamat datang, Guest');
    }
  }
}
