# LOGIN UI x FLUTTER

![login_ui](https://user-images.githubusercontent.com/118524346/209577389-23b844f4-5001-44d5-b5df-c4ba3d9738be.jpg)

## 1.0.0
**Just decorating the UI, nothing more**

## 1.0.1

https://user-images.githubusercontent.com/118524346/210141032-f4dc3548-b4cd-4356-bfdd-9e4263f4a084.mp4

- **Added the Auth Page and loading circles**
* **Errors with wrong data**
+ **Created user manually on the Firebase console, also implemented the code under**

```
try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
```

## 1.0.2

https://user-images.githubusercontent.com/118524346/210182798-c5c22648-a795-41e9-84d2-b3e5f79a8dac.mp4

- **Added register page with active 'Register now' button**
* **Directly from our app now you can create a new user**
+ **Added checking of passwords matching, with new textfield 'Confirm password'**
+ **Alert - if password is too short, common**

## 1.0.3

https://user-images.githubusercontent.com/118524346/210260094-4d16e680-5293-4d82-98be-ecd4b6d44da1.mp4

- **Google sign in button now is active**