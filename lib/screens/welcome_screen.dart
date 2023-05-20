import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return  Container(
      height: height,
      width: width,
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 75,),
            Icon(
              Icons.local_hospital,
              size: 200,
              color: Colors.white,
              ),
            Text(
              'Dokter Dirumah',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: 2
              ),
            ),
            Text(
              'Solusi anda untuk hidup sehat dengan mandiri',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50,),
            Icon(
              Icons.arrow_forward_rounded,
              size: 150,
              color: Colors.white,
              ),
          ]),
      ),
    );
  }
}
