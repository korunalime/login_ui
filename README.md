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