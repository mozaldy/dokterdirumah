import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dokter_dirumah/model/user.dart' as model;
import 'package:dokter_dirumah/controllers/auth.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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

    void updateUser() async {
      AuthController controller = AuthController();
      String res = await controller.updateUser(
          username: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          oldPassword: _oldPasswordController.text);
      FirebaseAuth.instance.signOut();

      showSnackBar(context, res);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthLogo(title: 'Profil'),
            TextInput(
              textEditingController: _usernameController,
              hintText: user.username,
              textInputType: TextInputType.emailAddress,
            ),
            TextInput(
              textEditingController: _emailController,
              hintText: user.email,
              textInputType: TextInputType.emailAddress,
            ),
            TextInput(
              textEditingController: _oldPasswordController,
              hintText: 'Old Password',
              textInputType: TextInputType.emailAddress,
              isPassword: true,
            ),
            TextInput(
              textEditingController: _passwordController,
              hintText: 'New Password',
              textInputType: TextInputType.emailAddress,
              isPassword: true,
            ),
            CustomButtom(
                buttonColor: primaryColor,
                textColor: backgroundColor,
                text: 'Update',
                onPress: () {
                  updateUser();
                }),
            const SizedBox(
              height: 10,
            ),
            CustomButtom(
                buttonColor: primaryColor,
                textColor: backgroundColor,
                text: 'Logout',
                onPress: () {
                  FirebaseAuth.instance.signOut();
                }),
          ],
        ),
      ),
    );
  }
}
