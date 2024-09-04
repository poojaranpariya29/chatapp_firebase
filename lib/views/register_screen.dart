import 'package:chatapp_firebase/model/routes.dart';

import '../controller/auth_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../model/auth_model.dart';
import '../controller/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Spacer(),
          Image.asset('assets/logo.png', width: 100, height: 100),
          const Spacer(),
          CustomTextField(
            keyboardType: TextInputType.name,
            label: 'Username',
            controller: usernameController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            keyboardType: TextInputType.emailAddress,
            label: 'Email',
            controller: emailPhoneController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            keyboardType: TextInputType.visiblePassword,
            label: 'Password',
            controller: passwordController,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              AuthHelper()
                  .register(
                data: RegisterModel(usernameController.text,
                    emailPhoneController.text, passwordController.text),
              )
                  .then((value) {
                if (value['user'] != null) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, homeScreen, (route) => false);
                } else {
                  snackbar(context, 'Try again later');
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5)),
              child:
                  const Text('Register', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(children: [
              const TextSpan(text: 'You have already Account? '),
              TextSpan(
                  text: 'Login',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.pushNamed(context, loginScreen))
            ]),
          ),
          const Spacer()
        ]),
      ),
    );
  }
}
