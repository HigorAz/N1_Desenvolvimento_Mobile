import 'package:firebase_auth/firebase_auth.dart';

class Authenticator {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> authenticate(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print('Erro de autenticação: $e');
      return false;
    }
  }
}
