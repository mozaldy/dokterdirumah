import 'package:dokter_dirumah/widgets/static.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../controlllers/auth.dart';
import '../widgets/textinput.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void registrasiUser() async {
    AuthController controller = AuthController();
    String res = await controller.registrasiUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text);
    registrasiHandler(res);
  }

  void registrasiHandler(res) {
    if (res == 'Success') {
      Navigator.pop(context);
    } else {
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthLogo(title: 'Register'),
            TextInput(
              textEditingController: _usernameController,
              hintText: 'Username',
              textInputType: TextInputType.emailAddress,
            ),
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
                buttonColor: primaryColor,
                textColor: backgroundColor,
                text: 'Register',
                onPress: () {
                  registrasiUser();
                }),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                  const TextSpan(text: 'Sudah punya akun? '),
                  TextSpan(
                      text: 'Login',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        })
                ])),
          ],
        ),
      ),
    );
  }
}
