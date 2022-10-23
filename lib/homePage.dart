// import 'package:flutter/material.dart';
// import 'package:login/ImageFromGalleryEx.dart';
//
// class homePage extends StatelessWidget {
//   const homePage({Key? key}) : super(key: key);
//
//   static const routeName = '/homepage';
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       //appBar: AppBar(title: const Text(String_title)),
//       body: homePage(),
//     );
//   }
// }
// enum ImageSourceType{gallery,camera}
//
// class myHomePage extends StatefulWidget {
//   const myHomePage({Key? key}) : super(key: key);
//   // final text;
//   //
//   // myHomePage(this.text);
//
// // This widget is the home page of your application. It is stateful, meaning
// // that it has a State object (defined below) that contains fields that affect
// // how it looks.
//
// // This class is the configuration for the state. It holds the values (in this
// // case the title) provided by the parent (in this case the App widget) and
// // used by the build method of the State. Fields in a Widget subclass are
// // always marked "final".
//
//   @override
//   State<myHomePage> createState() => _myHomePageState();
// }
//
// class _myHomePageState extends State<myHomePage> {
//   //var text;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView(
//           children: <Widget>[
//             MaterialButton(
//               color: Colors.blue,
//               child: const Text("Pick an image",
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold)),
//               onPressed: () {
//                 _handleURLButtonPress(context, ImageSourceType.gallery);
//               },
//             ),
//             MaterialButton(
//               color: Colors.blue,
//               child: const Text("Take an image",
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold)),
//               onPressed: () {
//                 _handleURLButtonPress(context, ImageSourceType.camera);
//               },
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: ListView(
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'nameController.text',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w200,
//                         fontSize: 20),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'passwordController.text',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w200,
//                         fontSize: 20),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'fullNameController.text',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w200,
//                           fontSize: 20),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'emailController.text',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w200,
//                           fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
//
//   // void _signupInfo(BuildContext context, var text){
//   //   Navigator.push(context,
//   //       MaterialPageRoute(builder: (context) => myHomePage(text)));
//   // }
//
//   void _handleURLButtonPress(BuildContext context, var type) {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/signup.dart';
import 'package:login/login.dart';

import 'auth_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        // Padding(
        //   padding: EdgeInsets.all(30),
        //   child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Something Went Wrong'),
                  );
                } else if (snapshot.hasData) {
                  return Center(
                      child: Text(
                    user.email!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ));
                } else {
                  return AuthPage();
                }
              },
            ),
          ),

          // try {
          //   await FirebaseAuth.instance.signInWithEmailAndPassword(
          //       email: emailController.text.trim(),
          //       password: passwordController.text.trim())
          //   // .then((snapshot) => HomePage())
          //       ;
          // } on FirebaseAuthException catch (e) {
          //   print(e);
          // }
          // Text(
          //   'Signed in as',
          //   style: TextStyle(fontSize: 16),
          // )
          // ,
          // SizedBox(height: 10,),
          // Text(
          // user.email!,
          // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          // ),
          // Text(
          //   user.name!,
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          // ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            label: Text(
              'Sign Out',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
      ),
    );
  }
}
