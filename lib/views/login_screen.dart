  import 'package:dokter_dirumah/views/welcome_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../controllers/auth.dart';
import '../widgets/textinput.dart';
import '../widgets/static.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    AuthController controller = AuthController();
    String res = await controller.loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res != 'Success') showSnackBar(context, res);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: [
            InkWell(
                child: const WelcomeScreen(),
                onTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }),
            SizedBox(
              height: height,
              width: width,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthLogo(title: 'Login'),
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
                        buttonColor: Colors.red,
                        textColor: Colors.white,
                        text: 'Login',
                        onPress: () {
                          loginUser();
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: <TextSpan>[
                          const TextSpan(text: 'Belum punya akun? '),
                          TextSpan(
                              text: 'Register',
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/register');
                                })
                        ])),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
