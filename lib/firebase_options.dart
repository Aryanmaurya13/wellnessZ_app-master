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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC-s3hlVXGMKeEfRw-jdUAa17VRWz-x1p0',
    appId: '1:806952824955:web:7a72ee4929828f7e66f2de',
    messagingSenderId: '806952824955',
    projectId: 'wellnessz-app',
    authDomain: 'wellnessz-app.firebaseapp.com',
    storageBucket: 'wellnessz-app.appspot.com',
    measurementId: 'G-SYX4JR7K56',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWDh4tYJaOKor1y4MFZs6kblA6p7awjss',
    appId: '1:806952824955:android:3494f440d115449a66f2de',
    messagingSenderId: '806952824955',
    projectId: 'wellnessz-app',
    storageBucket: 'wellnessz-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwVMl9iWLmGsJp3UjAiTkVHEM8LU8pJik',
    appId: '1:806952824955:ios:bea55f72e946320c66f2de',
    messagingSenderId: '806952824955',
    projectId: 'wellnessz-app',
    storageBucket: 'wellnessz-app.appspot.com',
    iosBundleId: 'com.wellnessz.wellnesszApp',
  );
}
