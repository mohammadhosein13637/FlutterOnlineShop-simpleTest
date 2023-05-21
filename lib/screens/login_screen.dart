import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'emailConfirmation_Screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'emailConfirmation_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailController = TextEditingController();
  Color hintTextColor = Colors.black;
  double containerWidth = 0.7;
  double tOpacity = 0;
  bool isTapped = false;
  bool isNull = false;

// Checking Email Function

  bool _isValidEmail(String email) {
    // Define a regular expression to match email pattern
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    // Dispose of the TextEditingController
    emailController.dispose();
    super.dispose();
    
  }

// going to new page animation function

  void _newPageAnimation(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => emailConfirmationPage(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900]!,
                  Colors.orange[800]!,
                  Colors.orange[400]!
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 15, 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login',
                          style: GoogleFonts.kalam(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold))),
                      const Text('Welcome Back ',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              30,
                              MediaQuery.of(context).viewInsets.bottom > 0
                                  ? 30
                                  : 150,
                              30,
                              30),
                          child: Column(
                            children: [
                              //Email Input
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(tOpacity),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  onTap: () => {
                                    setState(() {
                                      isTapped = true;
                                      tOpacity = 0.8;

                                      containerWidth = 0.9;
                                    })
                                  },
                                  onChanged: (value) {
                                    bool isValid = _isValidEmail(value);
                                    if (isValid) {
                                      setState(() {
                                        hintTextColor = Colors.grey[600]!;
                                        isNull = true;
                                      });
                                    } else {
                                      setState(() {
                                        hintTextColor = Colors.deepOrange;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 20.0, top: 12.0, right: 20),
                                    hintText: 'Email Adress',
                                    labelText: "Email",
                                    labelStyle: TextStyle(color: hintTextColor),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintStyle: TextStyle(
                                        color: hintTextColor, wordSpacing: 3),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.deepOrange)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                            BorderSide(color: hintTextColor)),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 40,
                              ),

                              //Button
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    colors: [
                                      Colors.orange[400]!,
                                      Colors.orange[800]!,
                                      Colors.orange[900]!
                                    ],
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (isNull == true) {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: const emailConfirmationPage()));
                                    }
                                    
                                  },
                                  child: const Text('Send Confirmation',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
