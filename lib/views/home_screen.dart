import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/textinput.dart';
import '../widgets/static.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "";
  bool dokter = false;
  String email = "";

  @override
  void initState() {
    getUsername();
    super.initState();
  }

  void getUsername() async {
    var snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username = snap.data()!['username'];
    dokter = snap.data()!['dokter'];
    email = snap.data()!['email'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Selamat datangz, $username"),
            Text(dokter ? 'anda adalah dokter' : 'anda bukan dokter'),
            Text('email: $email'),
            const SizedBox(height: 16),
            CustomButtom(
                buttonColor: Colors.red,
                textColor: Colors.white,
                text: 'Logout',
                onPress: () {
                  FirebaseAuth.instance.signOut();
                  
                  // Navigator.pop(context);
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,

        selectedItemColor: Colors.red[100],

        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Cari',  ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home,), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,), label: 'Profile'),
        ]
      ),
    );
  }
}
