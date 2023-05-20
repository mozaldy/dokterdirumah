import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/textinput.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                text: 'Register',
                onPress: () {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.length > 6) {
                    registrasi();
                  } else {
                    debugPrint("Terjadi kesalahan");
                  }
                }),
            CustomButtom(
                buttonColor: Colors.blue,
                textColor: Colors.white,
                text: 'Login',
                onPress: () {
                  Navigator.pushNamed(context, '/login');
                })
          ],
        ),
      ),
    );
  }
  Future<void> registrasi() async {
    final auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }
}
