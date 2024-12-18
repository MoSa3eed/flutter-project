import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_it/screens/home_screen.dart';
import 'package:project_it/screens/signup.dart';
import 'package:project_it/widgets/custom_button.dart';
import 'package:project_it/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 2.7,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/login.jpg",
                ),
              ),
              SharedTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  textInputAction: TextInputAction.next,
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  }),
              SharedTextField(
                controller: passwordController,
                hintText: "Enter your password",
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.lock),
                obsecure: !isPasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
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
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 35),
              //   child: Align(
              //     alignment: Alignment.centerRight,
              //     child: Text(
              //       'Forgot Password?',
              //       style: TextStyle(
              //           color: Colors.blue,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              SharedButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'No user found for that email.',
                          ).show();
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Error',
                            desc: 'No user found for that email.',
                          ).show();
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'Wrong password provided for that user.',
                        ).show();
                      }
                    } else {
                      print('Not Valid');
                    }
                  },
                  //  loginUsers,
                  text: 'Log In'),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
