import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/ResetPassword.dart';
import 'package:login/signup.dart';
import 'package:flutter/gestures.dart';
import 'auth_page.dart';
import 'homePage.dart';

// class logIn extends StatelessWidget {
//   const logIn({Key? key}) : super(key: key);
//
//   static const routeName = '/login';
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       //appBar: AppBar(title: const Text(String_title)),
//       body: LogInWidget(),
//     );
//   }
// }

// class LoginWidget extends StatefulWidget {
//   final VoidCallback? onClickedSignUp;
//   const LoginWidget({
//     Key? key,
//     this.onClickedSignUp,
//   }) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class LogInWidget extends StatefulWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final VoidCallback? onClickedSignUp;

  const LogInWidget({
    Key? key,
    this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   child: StreamBuilder<User?>(
          //       stream: FirebaseAuth.instance.authStateChanges(),
          //       builder: (context, snapshot) {
          //         if (snapshot.connectionState == ConnectionState.waiting) {
          //           return Center(
          //             child: CircularProgressIndicator(),
          //           );
          //         } else if (snapshot.hasError) {
          //           return Center(
          //             child: Text('Something Went Wrong'),
          //           );
          //         } else if (snapshot.hasData) {
          //           return HomePage();
          //         } else {
          //           return AuthPage();
          //         }
          //       },
          //   ),
          // ),
          Expanded(
              child: ListView(
                children: <Widget> [
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      )),
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
                        print(emailController);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      onChanged: (val) {
                        validatePassword(val);
                        print(passwordController);
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => resetPasswordPage()));
                    },
                    child: const Text('Forgot Password'),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                          child: const Text('Login'),
                          onPressed: () async {
                            try {
                              await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim())
                              // .then((snapshot) => HomePage())
                                  ;
                            } on FirebaseAuthException catch (e) {
                              print(e);
                            }
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage()));
                          })),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does not have an account?'),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // RichText(
                      //     text: TextSpan(
                      //         style:
                      //             TextStyle(color: Colors.black, fontSize: 16),
                      //         // text: 'No Account?..',
                      //         children: [
                      //       TextSpan(
                      //           recognizer: TapGestureRecognizer()
                      //             ..onTap = widget.onClickedSignUp,
                      //           text: 'Sign Up',
                      //           style: const TextStyle(
                      //             fontSize: 20,
                      //             // decoration: TextDecoration.underline,
                      //             // color: Colors.indigo,
                      //           ))
                      //     ]))
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          //signup screen
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUpWidget()));
                        },
                      ),
                    ],
              )
          // Container(
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.all(10),
          //     child: const Text(
          //       'Login',
          //       style: TextStyle(
          //           color: Colors.black,
          //           fontWeight: FontWeight.w500,
          //           fontSize: 30),
          //     )),
          // Container(
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.all(10),
          //     child: const Text(
          //       'Sign in',
          //       style: TextStyle(fontSize: 20),
          //     )),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   child: TextFormField(
          //     controller: emailController,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'E-Mail',
          //     ),
          //     onChanged: (val) {
          //       validateEmail(val);
          //       print(emailController);
          //     },
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          //   child: TextField(
          //     obscureText: true,
          //     controller: passwordController,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(),
          //       labelText: 'Password',
          //     ),
          //     onChanged: (val) {
          //       validatePassword(val);
          //       print(passwordController);
          //     },
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {
          //     //forgot password screen
          //   },
          //   child: const Text('Forgot Password'),
          // ),
          // Container(
          //     height: 50,
          //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //     child: ElevatedButton(
          //         child: const Text('Login'),
          //         onPressed: () async {
          //           try {
          //             await FirebaseAuth.instance.signInWithEmailAndPassword(
          //                     email: emailController.text.trim(),
          //                     password: passwordController.text.trim())
          //                 // .then((snapshot) => HomePage())
          //                 ;
          //           } on FirebaseAuthException catch (e) {
          //             print(e);
          //           }
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => HomePage()));
          //         })),
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Text(
          //     _errorMessage,
          //     style: TextStyle(color: Colors.red),
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     const Text('Does not have an account?'),
          //     // const SizedBox(
          //     //   height: 20,
          //     // ),
          //     // RichText(
          //     //     text: TextSpan(
          //     //         style:
          //     //             TextStyle(color: Colors.black, fontSize: 16),
          //     //         // text: 'No Account?..',
          //     //         children: [
          //     //       TextSpan(
          //     //           recognizer: TapGestureRecognizer()
          //     //             ..onTap = widget.onClickedSignUp,
          //     //           text: 'Sign Up',
          //     //           style: const TextStyle(
          //     //             fontSize: 20,
          //     //             // decoration: TextDecoration.underline,
          //     //             // color: Colors.indigo,
          //     //           ))
          //     //     ]))
          //     TextButton(
          //       child: const Text(
          //         'Sign Up',
          //         style: TextStyle(fontSize: 20),
          //       ),
          //       onPressed: () {
          //         //signup screen
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => SignUpWidget()));
          //       },
          //     ),
            ],
          )),
        ],
      ),
      // child: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     return ListView(
      //         // padding: const EdgeInsets.all(10),
      //         children: <Widget>[
      //           StreamBuilder<User?>(
      //             builder: (context, snapshot) {
      //               if (snapshot.connectionState == ConnectionState.waiting) {
      //                 return Center(
      //                   child: CircularProgressIndicator(),
      //                 );
      //               } else if (snapshot.hasError) {
      //                 return Center(
      //                   child: Text('Something Went Wrong'),
      //                 );
      //               } else if (snapshot.hasData) {
      //                 return HomePage();
      //               } else {
      //                 return AuthPage();
      //               }
      //             },
      //           ),
      //           Container(
      //               alignment: Alignment.center,
      //               padding: const EdgeInsets.all(10),
      //               child: const Text(
      //                 'Login',
      //                 style: TextStyle(
      //                     color: Colors.black,
      //                     fontWeight: FontWeight.w500,
      //                     fontSize: 30),
      //               )),
      //           Container(
      //               alignment: Alignment.center,
      //               padding: const EdgeInsets.all(10),
      //               child: const Text(
      //                 'Sign in',
      //                 style: TextStyle(fontSize: 20),
      //               )),
      //           Container(
      //             padding: const EdgeInsets.all(10),
      //             child: TextFormField(
      //               controller: emailController,
      //               decoration: const InputDecoration(
      //                 border: OutlineInputBorder(),
      //                 labelText: 'E-Mail',
      //               ),
      //               onChanged: (val) {
      //                 validateEmail(val);
      //                 print(emailController);
      //               },
      //             ),
      //           ),
      //           Container(
      //             padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      //             child: TextField(
      //               obscureText: true,
      //               controller: passwordController,
      //               decoration: const InputDecoration(
      //                 border: OutlineInputBorder(),
      //                 labelText: 'Password',
      //               ),
      //               onChanged: (val) {
      //                 validatePassword(val);
      //                 print(passwordController);
      //               },
      //             ),
      //           ),
      //           TextButton(
      //             onPressed: () {
      //               //forgot password screen
      //             },
      //             child: const Text('Forgot Password'),
      //           ),
      //           Container(
      //               height: 50,
      //               padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      //               child: ElevatedButton(
      //                 child: const Text('Login'),
      //                 onPressed: LogIn,
      //               )),
      //           Padding(
      //             padding: const EdgeInsets.all(10),
      //             child: Text(
      //               _errorMessage,
      //               style: TextStyle(color: Colors.red),
      //             ),
      //           ),
      //           Row(
      //             children: <Widget>[
      //               const Text('Does not have account?'),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               RichText(
      //                   text: TextSpan(
      //                       style:
      //                           TextStyle(color: Colors.black, fontSize: 16),
      //                       // text: 'No Account?..',
      //                       children: [
      //                     TextSpan(
      //                         recognizer: TapGestureRecognizer()
      //                           ..onTap = widget.onClickedSignUp,
      //                         text: 'Sign Up',
      //                         style: const TextStyle(
      //                           fontSize: 20,
      //                           // decoration: TextDecoration.underline,
      //                           // color: Colors.indigo,
      //                         ))
      //                   ]))
      //               // TextButton(
      //               //   child: const Text(
      //               //     'Sign Up',
      //               //     style: TextStyle(fontSize: 20),
      //               //   ),
      //               //   onPressed: () {
      //               //     //signup screen
      //               //     Navigator.push(context,
      //               //         MaterialPageRoute(builder: (context) => SignUpWidget()));
      //               //   },
      //               // )
      //             ],
      //             mainAxisAlignment: MainAxisAlignment.center,
      //           ),
      //         ]);
      //   }),
    );
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
    }
    // else if (passwordController.text != confirmPasswordController.text) {
    //   setState(() {
    //     _errorMessage = "Password Doesn't Match";
    //   });
    // }
    else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

// Future LogIn() async {
//     // StreamBuilder<User?>(
//     //
//     //   builder: (context, snapshot) {
//     //     if (snapshot.connectionState == ConnectionState.waiting) {
//     //       return Center(
//     //         child: CircularProgressIndicator(),
//     //       );
//     //     } else if (snapshot.hasError) {
//     //       return Center(
//     //         child: Text('Something Went Wrong'),
//     //       );
//     //     } else if (snapshot.hasData) {
//     //       // return HomePage();
//     //       Navigator.push(context,
//     //           MaterialPageRoute(builder: (context) => HomePage()));
//     //       // return Center(
//     //       //   child: Text('Logged In'),
//     //       // );
//     //     } else {
//     //       return AuthPage();
//     //     }
//     //   },
//     // );
//
//   try {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim())
//         // .then((snapshot) => HomePage())
//     ;
//   } on FirebaseAuthException catch (e) {
//     print(e);
//   }
// }
}
