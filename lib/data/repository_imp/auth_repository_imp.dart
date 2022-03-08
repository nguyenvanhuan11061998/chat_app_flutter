


import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  @override
  Future login(String email, String pass) async {
    return _auth.signInWithEmailAndPassword(email: email, password: pass);
  }

  @override
  Future createAccount(String email, String password) async {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future signOut() async {
    await _auth.signOut();
  }
}