import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_it/screens/home_screen.dart';
import 'package:project_it/screens/login.dart';

import 'screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //  options: const FirebaseOptions(
      //   apiKey:
      //       "AIzaSyCbgc_JltBgC4oTNzquh6kJpS-Dl1gO5bUAIzaSyCbgc_JltBgC4oTNzquh6kJpS-Dl1gO5bU", // paste your api key here
      //   appId:
      //       "1:410327637132:android:cbd1d2f7e6e1e42683efa9", //paste your app id here
      //   messagingSenderId: "410327637132", //paste your messagingSenderId here
      //   projectId: "project-it-62513", //paste your project id here
      // ),
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
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '======================================== User is currently signed out!');
      } else {
        print('======================================== User is signed in!');
      }
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : const HomeScreen(),
      routes: {
        "signup": (context) => const SignUpScreen(),
        "login": (context) => const LoginScreen(),
        "homescreeen": (context) => const HomeScreen(),
      },
      //  StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return HomeScreen();
      //       } else {
      //         return LoginScreen();
      //       }
      //     }),
    );
  }
}
