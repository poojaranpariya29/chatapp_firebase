import 'package:chatapp_firebase/model/routes.dart';
import '../controller/auth_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      if (AuthHelper().getCurrentUser() != null) {
        return Navigator.pushReplacementNamed(context, homeScreen);
      } else {
        return Navigator.pushReplacementNamed(context, loginScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset('assets/splash.gif'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
