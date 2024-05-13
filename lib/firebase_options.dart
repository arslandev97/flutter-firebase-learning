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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBpRIBJnEhOzwDoxsBCP6YLjmnj-0L3qCM',
    appId: '1:342838764796:web:f5e477ee9c5f8f73b66379',
    messagingSenderId: '342838764796',
    projectId: 'email-auth-testing-8caa3',
    authDomain: 'email-auth-testing-8caa3.firebaseapp.com',
    storageBucket: 'email-auth-testing-8caa3.appspot.com',
    measurementId: 'G-0R8M7FPK0B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnXDwad2iQGmpipOfqfNlKVQKl-xwI4F8',
    appId: '1:342838764796:android:a5a95a4217e1d4a1b66379',
    messagingSenderId: '342838764796',
    projectId: 'email-auth-testing-8caa3',
    storageBucket: 'email-auth-testing-8caa3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJ2S-CNyRTXsEnnBw7Jg4zl06iicy6vEY',
    appId: '1:342838764796:ios:d88614751a113d81b66379',
    messagingSenderId: '342838764796',
    projectId: 'email-auth-testing-8caa3',
    storageBucket: 'email-auth-testing-8caa3.appspot.com',
    iosBundleId: 'com.example.emailAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJ2S-CNyRTXsEnnBw7Jg4zl06iicy6vEY',
    appId: '1:342838764796:ios:d88614751a113d81b66379',
    messagingSenderId: '342838764796',
    projectId: 'email-auth-testing-8caa3',
    storageBucket: 'email-auth-testing-8caa3.appspot.com',
    iosBundleId: 'com.example.emailAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBpRIBJnEhOzwDoxsBCP6YLjmnj-0L3qCM',
    appId: '1:342838764796:web:5b5fa89343c28643b66379',
    messagingSenderId: '342838764796',
    projectId: 'email-auth-testing-8caa3',
    authDomain: 'email-auth-testing-8caa3.firebaseapp.com',
    storageBucket: 'email-auth-testing-8caa3.appspot.com',
    measurementId: 'G-MXHJFJ1QHY',
  );
}