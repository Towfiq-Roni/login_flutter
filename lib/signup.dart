import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login/ImageFromGalleryEx.dart';
import 'package:login/login.dart';
import 'package:image_picker/image_picker.dart';

class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);

  static const routeName = '/signup';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: AppBar(title: const Text(String_title)),
      body: MyHomePage(),
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
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            // Container(
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(10),
            //     child: const Text(
            //       'Sign in',
            //       style: TextStyle(fontSize: 20),
            //     )),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                  "Pick an image",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold
                  )
              ),
              onPressed: () {
                _handleURLButtonPress(context, ImageSourceType.gallery);
              },),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                  "Take an image",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold
                  )
              ),
              onPressed: () {
                _handleURLButtonPress(context, ImageSourceType.camera);
              },),
            Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ))),
            Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    controller: fullNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ))),
            Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-Mail',
                  ),
                  onChanged: (val) {
                    validateEmail(val);
                  },
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (value) {
                  validatepassword(value);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                obscureText: true,
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
                onChanged: (value) {
                  validatepassword(value);
                },
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password'),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                    print(confirmPasswordController.text);
                    print(fullNameController.text);
                    print(emailController.text);
                  },
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(_errorMessage, style: TextStyle(color: Colors.red),),
            ),
          ],
        ));
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "E-Mail mustn't be empty";
      });
    }
    else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Enter valid E-mail address";
      });
    }
    else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  void validatepassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorMessage = "Enter a Password";
      });
    }
    else if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        _errorMessage = "Password Doesn't Match";
      });
    }
    else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }
}