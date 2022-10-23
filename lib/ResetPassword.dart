import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/auth.dart';
import 'package:flutter/services.dart';
import 'auth.dart';

class resetPasswordPage extends StatefulWidget {

  @override
  State<resetPasswordPage> createState() => _resetPasswordPageState();
}

class _resetPasswordPageState extends State<resetPasswordPage> {
  String email = '';
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: 'E-Mail',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: ElevatedButton(
                  child: Text('Reset Password'),
                  onPressed: () => resetPassword(
                      email: emailController.text.trim()),
                ),
              )
            ],
          ),
        ),
    );
  }

  Future<void> resetPassword({required String email}) async{
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    // final User user = (
        await _firebaseAuth.sendPasswordResetEmail(
        email: email);
    // )
    // as User;
    // return user;
  }
  
  // void userResetPassword() async {
  //   // final User user = (emailController.text.trim()) as User;
  //   // await Services.auth.resetPassword(email: email);
  //   try{
  //     await widget.auth.resetPassword();
  //   } catch (e){
  //     print (e);
  //   }
  // }
}
