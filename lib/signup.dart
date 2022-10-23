import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/ImageFromGalleryEx.dart';
import 'package:login/homePage.dart';
import 'package:login/login.dart';
import 'package:image_picker/image_picker.dart';

// class signUp extends StatelessWidget {
//   const signUp({Key? key}) : super(key: key);
//
//   static const routeName = '/signup';
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       //appBar: AppBar(title: const Text(String_title)),
//       body: SignUpWidget(),
//     );
//   }
// }

// class SignUpWidget extends StatefulWidget {
//   final VoidCallback? onClickedSignIn;
//
//   const SignUpWidget({
//     Key? key,
//     this.onClickedSignIn,
//   }) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class SignUpWidget extends StatefulWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final VoidCallback? onClickedSignIn;

  const SignUpWidget({
    Key? key,
    this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String _errorMessage = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Form(
                 key: formKey,
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
                      child: const Text("Pick an image",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        _handleURLButtonPress(context, ImageSourceType.gallery);
                      },
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      child: const Text("Take an image",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        _handleURLButtonPress(context, ImageSourceType.camera);
                      },
                    ),
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
                          ),
                        )),
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'E-Mail',
                              ),
                              onChanged: (val) async {
                                validateEmail(val);
                                // try {
                                //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                //     email: emailController.text,
                                //     password: passwordController.text,
                                //   );
                                // } on FirebaseAuthException catch (e) {
                                //   if (e.code == 'weak-password') {
                                //     print('The password provided is too weak.');
                                //   } else if (e.code == 'email-already-in-use') {
                                //     print('The account already exists for that email.');
                                //   }
                                // } catch (e) {
                                //   print(e);
                                // }
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
                            onChanged: (value) async {
                              validatePassword(value);
                              // try {
                              //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              //     email: emailController.text,
                              //     password: passwordController.text,
                              //   );
                              // } on FirebaseAuthException catch (e) {
                              //   if (e.code == 'weak-password') {
                              //     print('The password provided is too weak.');
                              //   } else if (e.code == 'email-already-in-use') {
                              //     print('The account already exists for that email.');
                              //   }
                              // } catch (e) {
                              //   print(e);
                              // }
                            },
                          ),
                        ),
                        // new GestureDetector(
                        //   onTap: () async {
                        //     try {
                        //       await FirebaseAuth.instance
                        //           .createUserWithEmailAndPassword(
                        //         email: emailController.text,
                        //         password: passwordController.text,
                        //       );
                        //     } on FirebaseAuthException catch (e) {
                        //       if (e.code == 'weak-password') {
                        //         print('The password provided is too weak.');
                        //       } else if (e.code == 'email-already-in-use') {
                        //         print('The account already exists for that email.');
                        //       }
                        //     } catch (e) {
                        //       print(e);
                        //     }
                        //   },
                        // )
                      ],
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
                          validatePassword(value);
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
                          onPressed: SignUp,
                          //     () {
                          //   print(nameController.text);
                          //   print(passwordController.text);
                          //   print(confirmPasswordController.text);
                          //   print(fullNameController.text);
                          //   print(emailController.text);
                          // },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        _errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ))),
    );
    // try{
    //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: emailController.text,
    //     password: passwordController.text,
    //   );
    // }
    // on FirebaseAuthException catch (e){
    //   if (e.code == passwordController.text){
    //     print('Password is Correct');
    //   }
    //   else if(e.code == emailController.text){
    //     print('Email is okay');
    //   }
    // }
    // catch (e){
    //   print(e);
    // }
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "E-Mail mustn't be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Enter valid E-mail address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorMessage = "Enter a Password";
      });
    } else if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        _errorMessage = "Password Doesn't Match";
      });
    } else if (value.length<8){
      setState(() {
        _errorMessage = "Password should not be less than 8 characters";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  Future SignUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          // name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    // Navigator.of(context).popUntil((route) => true);
  }
}
