import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../pages/reigister_page.dart';

class ShowRegisterPage extends StatefulWidget {
  const ShowRegisterPage({super.key});

  @override
  State<ShowRegisterPage> createState() => _ShowRegisterPageState();
}

class _ShowRegisterPageState extends State<ShowRegisterPage> {
  bool showLoginPage = true;

  void switchPages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: switchPages,
      );
    } else {
      return RegisterPage(
        onTap: switchPages,
      );
    }
  }
}
