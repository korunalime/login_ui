import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../utils/logo_tile.dart';
import '../utils/button.dart';
import '../utils/textfields.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // controllers / username / password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign up method
  void signUp() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // sign up
    try {
      // checking password
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error, if passwords dont match
        Navigator.pop(context);
        return showErrorMessage("Passwords don't match!");
      }

      //loading circle off
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //loading circle off
      Navigator.pop(context);

      // show error
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              message,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // logo / welcome / create an account
              const Icon(
                Icons.lock,
                size: 90,
                color: Colors.black,
              ),

              const SizedBox(height: 40),

              Text(
                'Create an account!',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 25),

              // username / email field
              MyTextFields(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 15),

              // password field / forgot password?
              MyTextFields(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 15),

              // confirm password field
              MyTextFields(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // sign up / continue with
              MyButton(
                text: 'Sign Up',
                onTap: signUp,
              ),

              const SizedBox(height: 55),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('Continue with'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // google and apple sign buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // apple logo
                  LogoTile(imagePath: 'lib/images/apple-logo.png'),

                  SizedBox(width: 10),

                  // google logo
                  LogoTile(imagePath: 'lib/images/google-logo.png'),
                ],
              ),

              const SizedBox(height: 25),

              // if not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account?',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
