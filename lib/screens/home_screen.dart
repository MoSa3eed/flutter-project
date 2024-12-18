 
import 'package:flutter/material.dart';
 
import 'package:project_it/screens/main_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: content(context),
    );
  }

  Widget content(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "CAFFEINATED",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 45,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        GestureDetector(
          onTap: (() => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  MainScreen(page: 0),
                ),
              )),
          child: Container(
            height: 60,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.brown),
            child: const Center(
              child: Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //           textAlign: TextAlign.center,
      //           'Congratulations\nYou have logged in successfully'),
      //       SharedButton(
      //           onTap: () async {
      //             await FirebaseAuth.instance.signOut();
      //             Navigator.pushReplacement(context,
      //                 MaterialPageRoute(builder: (context) => const LoginScreen()));
      //           },
      //           text: 'Log Out')
      //     ],
      //   ),
      // ),
    );
  }
}
