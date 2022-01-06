import 'package:firebase_auth/firebase_auth.dart';

late FirebaseAuth _instance;

class AuthController {
  initAuth() async {
    _instance = FirebaseAuth.instance;
  }

  String get getUserId => _instance.currentUser!.uid;

  signup(String email, String password) async {
    await _instance.createUserWithEmailAndPassword(
        email: email, password: password);
    print(_instance.currentUser?.uid);
  }

  signin(String email, String password) async {
    await _instance.signInWithEmailAndPassword(
        email: email, password: password);
    print(_instance.currentUser?.uid);
  }

  signout() async {
    await _instance.signOut();
  }

  Stream<User?> userStream() {
    return _instance.authStateChanges();
  }
}
