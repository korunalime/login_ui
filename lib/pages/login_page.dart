import 'package:flutter/material.dart';
import 'package:login_ui/utils/logo_tile.dart';
import '../utils/button.dart';
import '../utils/textfields.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // controllers / username / password
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign in method
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const SizedBox(height: 60),
          
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
                controller: usernameController,
                hintText: 'Username',
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
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
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
