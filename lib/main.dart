import 'package:chatapp_firebase/views/register_screen.dart';
import 'package:chatapp_firebase/model/routes.dart';
import 'package:chatapp_firebase/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'views/home_screen.dart';
import 'views/login_screen.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 18),
            bodyMedium: TextStyle(fontSize: 16),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true),
      initialRoute: splashScreen,
      routes: {
        splashScreen: (context) => const SplashScreen(),
        loginScreen: (context) => const LoginScreen(),
        registerScreen: (context) => const RegisterScreen(),
        homeScreen: (context) => const HomeScreen(),
      },
    );
  }
}
