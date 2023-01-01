import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Logged in as: ${user.email!}',
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
