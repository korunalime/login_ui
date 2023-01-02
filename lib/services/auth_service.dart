import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  // google sign in
  signInGoogle() async {
    // sign in process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // getting auth data
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // user credentials
    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // sign in
    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }
}
