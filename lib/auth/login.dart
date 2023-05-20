import 'package:dokter_dirumah/screens/home_screen.dart';
import 'package:dokter_dirumah/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/textinput.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const WelcomeScreen(),
          SizedBox(
            height: height,
            width: width,
            child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextInput(
                  textEditingController: _emailController,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                TextInput(
                  textEditingController: _passwordController,
                  hintText: 'Password',
                  textInputType: TextInputType.emailAddress,
                  isPassword: true,
                ),
                CustomButtom(
                    buttonColor: Colors.white,
                    textColor: Colors.red,
                    text: 'Login',
                    onPress: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.length > 6) {
                        login();
                      } else {
                        debugPrint("Terjadi kesalahan");
                      }
                    }),
                CustomButtom(
                    buttonColor: Colors.red,
                    textColor: Colors.white,
                    text: 'Registrasi',
                    onPress: () {
                      Navigator.pushNamed(context, '/register');
                    })
              ],
            ),
                  ),
          ),
      ]),
    );
  }

  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }
}
