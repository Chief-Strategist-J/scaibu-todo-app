// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyAh0Oi-7P0X4bnnfgkYRtwjzoyjYrUG5hQ',
    appId: '1:285842097121:android:cf1dee9518a8de503a48a0',
    messagingSenderId: '285842097121',
    projectId: 'scaibu-todo-app',
    databaseURL: 'https://scaibu-todo-app-default-rtdb.firebaseio.com',
    storageBucket: 'scaibu-todo-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiMnit0DT6q6ctW9H3loQwkdjYzolTltM',
    appId: '1:285842097121:ios:51172e13cbb6be4f3a48a0',
    messagingSenderId: '285842097121',
    projectId: 'scaibu-todo-app',
    databaseURL: 'https://scaibu-todo-app-default-rtdb.firebaseio.com',
    storageBucket: 'scaibu-todo-app.firebasestorage.app',
    androidClientId: '285842097121-s9bekbu6ca8u8lemls4vce1k1ki0l1u7.apps.googleusercontent.com',
    iosClientId: '285842097121-bhh10v9sivo5i193l0nf07ni80485dkd.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDQ3uwm556uiJn6GmAlGSW6nY-xPkgaLWk',
    appId: '1:285842097121:web:5e7b2a569b4a344a3a48a0',
    messagingSenderId: '285842097121',
    projectId: 'scaibu-todo-app',
    authDomain: 'scaibu-todo-app.firebaseapp.com',
    databaseURL: 'https://scaibu-todo-app-default-rtdb.firebaseio.com',
    storageBucket: 'scaibu-todo-app.firebasestorage.app',
    measurementId: 'G-4X10P4DYGW',
  );

}