import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';
import '../utils/logo_tile.dart';
import '../utils/button.dart';
import '../utils/textfields.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers / username / password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in method
  void signIn() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //loading circle off
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //loading circle off
      Navigator.pop(context);

      // wrong email / show error
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      }

      // wrong password / show error
      if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  // message for wrong data / email
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  // password
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Wrong Password'),
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
              // logo / welcome
              const Icon(
                Icons.lock,
                size: 90,
                color: Colors.black,
              ),

              const SizedBox(height: 40),

              Text(
                'Welcome back you\'ve been missed!',
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

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in / continue with
              MyButton(
                text: 'Sign In',
                onTap: signIn,
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
                children: [
                  // apple button
                  LogoTile(
                    onTap: () {
                      
                    },
                    imagePath: 'lib/images/apple-logo.png',
                  ),

                  SizedBox(width: 10),

                  // google button
                  LogoTile(
                    onTap: () => AuthService().signInGoogle(),
                    imagePath: 'lib/images/google-logo.png',
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // if not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
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
