import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LogInWidget(onClickedSignUp: toggle,)
        : SignUpWidget(onClickedSignIn: toggle,);
  }
  void toggle() => setState(() {
  isLogin = !isLogin;
  });
}
