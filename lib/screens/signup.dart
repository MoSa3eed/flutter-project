import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_it/screens/home_screen.dart';
import 'package:project_it/screens/login.dart';
 
import 'package:project_it/widgets/custom_button.dart';
import 'package:project_it/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 2.8,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/signup.jpeg",
                  ),
                ),
                SharedTextField(
                  controller: nameController,
                  hintText: "Enter your name",
                  prefixIcon: const Icon(Icons.person),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                SharedTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
                SharedTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  prefixIcon: const Icon(Icons.lock),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  obsecure: !isPasswordVisible,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.remove_red_eye_outlined
                          : CupertinoIcons.eye_slash_fill,
                    ),
                  ),
                ),
                SharedButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          final Credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: 'The password provided is too weak.',
                            ).show();
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc:
                                  'The account already exists for that email.',
                            ).show();
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                      ;
                    },
                    text: 'Sign UP'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
