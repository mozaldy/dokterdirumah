import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:dokter_dirumah/widgets/textinput.dart';
import 'package:dokter_dirumah/widgets/static.dart';
import 'package:dokter_dirumah/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // String username = "";
  // bool dokter = false;
  // String email = "";

  @override
  void initState() {
    super.initState();
    // getUserdata();
  }

  // void getUserdata() async {
  //   var snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(widget.uid)
  //       .get();
  //   username = snap.data()!['username'];
  //   dokter = snap.data()!['dokter'];
  //   email = snap.data()!['email'];

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Selamat datangz, ${user.username}"),
            Text(user.dokter ? 'anda adalah dokter' : 'anda bukan dokter'),
            Text('email: ${user.email}'),
            const SizedBox(height: 16),
            CustomButtom(
                buttonColor: primaryColor,
                textColor: backgroundColor,
                text: 'Logout',
                onPress: () {
                  FirebaseAuth.instance.signOut();

                  // Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
