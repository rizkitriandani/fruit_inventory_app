// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAJmCapYy_Cg1vh11VDysq3VqE3TNZ-tJM',
    appId: '1:3206149554:web:eb83ef4fb3bf7a3b9f60ab',
    messagingSenderId: '3206149554',
    projectId: 'fruit-inventory-app',
    authDomain: 'fruit-inventory-app.firebaseapp.com',
    storageBucket: 'fruit-inventory-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMmCSVkc9XiKrC99BsuIWx93kmUVGoS9Q',
    appId: '1:3206149554:android:bad42e92675e2b729f60ab',
    messagingSenderId: '3206149554',
    projectId: 'fruit-inventory-app',
    storageBucket: 'fruit-inventory-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgUfV-VzpR8c8O5n09F-uGMXVsfnpwnOw',
    appId: '1:3206149554:ios:ba568999a4bc2db49f60ab',
    messagingSenderId: '3206149554',
    projectId: 'fruit-inventory-app',
    storageBucket: 'fruit-inventory-app.appspot.com',
    iosClientId: '3206149554-h9dbnnq47f3ls687195ifhicg842mcsq.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitInventoryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgUfV-VzpR8c8O5n09F-uGMXVsfnpwnOw',
    appId: '1:3206149554:ios:ba568999a4bc2db49f60ab',
    messagingSenderId: '3206149554',
    projectId: 'fruit-inventory-app',
    storageBucket: 'fruit-inventory-app.appspot.com',
    iosClientId: '3206149554-h9dbnnq47f3ls687195ifhicg842mcsq.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitInventoryApp',
  );
}
