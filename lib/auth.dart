import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<String> signIn(String email, String password);
  Future<String> createUser(String email, String password);
  Future<String> currentUser();
  // Future<String> resetPassword(String email);
  Future<void> signOut();
  // late final FirebaseAuth auth;
}

class Auth implements BaseAuth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final FirebaseAuth auth;
  Auth({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  @override
  Future<String> signIn(String email, String password) async{
    final User user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  @override
  Future<String> createUser(String email, String password) async {
    final User user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  @override
  Future<String> currentUser() async {
    final User user = await _firebaseAuth.currentUser!;
    return user.uid;
  }

  Future<User> resetPassword({required String email}) async{
    final User user = (await _firebaseAuth.sendPasswordResetEmail(
        email: email)) as User;
    return user;
  }

  @override
  Future<String> signOut() async{
    try{
      await auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e){
      return e.code;
    }
    catch (e){
      rethrow;
    }
  }
}