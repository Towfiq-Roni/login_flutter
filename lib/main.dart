import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const stringTitle = 'Login App';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: stringTitle,
        home: Scaffold(
          appBar: AppBar(title: const Text(stringTitle)),
          body: const MyHomePage(),
        ));
  }
}

class LogIn extends StatelessWidget{
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Log In'),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const logIn()
                )
            );
          },
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget{
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign Up'),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const signUp()
                )
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      floatingActionButton: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
            child: const Text('Sign Up'),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const signUp())
              );
            },
          ),
            ElevatedButton(
              child: const Text('Log In'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const logIn())
                );
              },
            )
          ]
        ),
      ),
    // ),
    );

  }
}
