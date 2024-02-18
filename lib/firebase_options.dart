// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAH0FvZATkouyEjWYeJmmSTqv0Uo3WXijM',
    appId: '1:716742702986:web:5b2e909375004a3e34ba73',
    messagingSenderId: '716742702986',
    projectId: 'pianta-grande-rg',
    authDomain: 'pianta-grande-rg.firebaseapp.com',
    storageBucket: 'pianta-grande-rg.appspot.com',
    measurementId: 'G-4K088WD1Y3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7ts2tcS9U8WVCcliL8zbu3uRhnakHlzc',
    appId: '1:716742702986:android:cd6acf58e0b4001434ba73',
    messagingSenderId: '716742702986',
    projectId: 'pianta-grande-rg',
    storageBucket: 'pianta-grande-rg.appspot.com',
  );
}