// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'firebase_options.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```

// await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform,
// );

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvCL0r9CwImI2JxhQ7RQsC-3VQCkawZ2w',
    appId: '1:510131032923:android:d8cf858a1187250e0d007e',
    messagingSenderId: '510131032923',
    projectId: 'flutter-login-and-such',
    storageBucket: 'flutter-login-and-such.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjR0bl5nQzCkvCNMB_iGvb0CXQYMTwQr0',
    appId: '1:510131032923:ios:132cbe72a85c77ec0d007e',
    messagingSenderId: '510131032923',
    projectId: 'flutter-login-and-such',
    storageBucket: 'flutter-login-and-such.appspot.com',
    iosClientId: '510131032923-eq78q3m2l2stsomudo2a6o9m6kgrv8ca.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );
}