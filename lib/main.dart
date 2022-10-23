import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/signup.dart';
import 'package:email_validator/email_validator.dart';
import 'auth_page.dart';
import 'firebase_options.dart';
import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homePage.dart';
import 'package:flutter/services.dart';

// void main() async {
//   runApp(const MyApp());
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//
//   );
//   // FirebaseAuth.instance.authStateChanges(
//   //
//   // );
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MyApp());
// }

Future main() async {
  //

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const stringTitle = 'Login App';
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: stringTitle,
      navigatorObservers: <NavigatorObserver>[observer],
      home: MyHomePage(
        title: stringTitle,
        // appBar: AppBar(title: const Text(stringTitle)),
        analytics: analytics,
        observer: observer,
      ),
      //   initialRoute: '/home',
      // routes: {
      //     '/home': (context) => const logIn(),
      // //   '/login': (context) => const signUp(),
      // },
    );
  }
}

// class LogIn extends StatelessWidget{
//   const LogIn({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Log In'),
//           onPressed: (){
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const logIn()
//                 )
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class SignUp extends StatelessWidget{
//   const SignUp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Sign Up'),
//           onPressed: (){
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const signUp()
//                 )
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.analytics,
    required this.observer,
  }) : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

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
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      // body: Column(
        floatingActionButton: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpWidget()));
                  },
                ),
                ElevatedButton(
                  child: const Text('Log In'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInWidget()));
                  },
                ),
                // StreamBuilder<User?>(
                //   stream: FirebaseAuth.instance.authStateChanges(),
                //   builder: (context, snapshot){
                //     if (snapshot.connectionState == ConnectionState.waiting){
                //       return Center(child: CircularProgressIndicator(),);
                //     }
                //     else if (snapshot.hasError){
                //       return Center(child: Text('Something Went Wrong'),);
                //     }
                //     else if(snapshot.hasData){
                //       return HomePage();
                //     }
                //     else {
                //       return AuthPage();
                //     }
                //   },
                // ),
          ])),
        );
    //     child: StreamBuilder<User?>(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshot){
    //       if (snapshot.connectionState == ConnectionState.waiting){
    //         return const Center(child: CircularProgressIndicator(),);
    //       }
    //       else if (snapshot.hasError){
    //         return const Center(child: Text('Something Went Wrong'),);
    //       }
    //       else if(snapshot.hasData){
    //         return const HomePage();
    //       }
    //       else {
    //         return const AuthPage();
    //       }
    //     },
    //     // floatingActionButton: Center(
    //     //   child: Column(
    //     //       crossAxisAlignment: CrossAxisAlignment.center,
    //     //       mainAxisAlignment: MainAxisAlignment.center,
    //     //       children: [
    //     //         ElevatedButton(
    //     //           child: const Text('Sign Up'),
    //     //           onPressed: () {
    //     //             Navigator.push(context,
    //     //                 MaterialPageRoute(builder: (context) => SignUpWidget()));
    //     //           },
    //     //         ),
    //     //         ElevatedButton(
    //     //           child: const Text('Log In'),
    //     //           onPressed: () {
    //     //             Navigator.push(context,
    //     //                 MaterialPageRoute(builder: (context) => LogInWidget()));
    //     //           },
    //     //         )
    //     //       ]),
    //     // ),
    //     // ),
    // ),
    //   );
  }
// void validateEmail(String val){
//   if(val.isEmpty){
//     setState(() {
//       _errorMessage = "E-Mail mustn't be empty";
//     });
//   }
//   else if(!EmailValidator.validate(val, true)){
//     setState(() {
//       _errorMessage = "Enter valid E-mail address";
//     });
//   }
//   else{
//     setState(() {
//       _errorMessage = "";
//     });
//   }
// }
}
