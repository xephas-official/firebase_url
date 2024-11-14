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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCVEMcIOP-YaTfqkeLg6DhSqZocDBKdDZw',
    appId: '1:113606069561:web:7f8baded9b4bb87ae1ece8',
    messagingSenderId: '113606069561',
    projectId: 'sociogram-f99b8',
    authDomain: 'sociogram-f99b8.firebaseapp.com',
    storageBucket: 'sociogram-f99b8.firebasestorage.app',
    measurementId: 'G-MFH82FMVPZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8VWnGfT8uw0CK0Y8FOOZ2n2Bl4Q3bbOw',
    appId: '1:113606069561:android:c45196aa6ab66f5ce1ece8',
    messagingSenderId: '113606069561',
    projectId: 'sociogram-f99b8',
    storageBucket: 'sociogram-f99b8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-ldCh5h6FPAFyz9euPE7e2rNVIv_Sxhk',
    appId: '1:113606069561:ios:727d3e7fe06f20dae1ece8',
    messagingSenderId: '113606069561',
    projectId: 'sociogram-f99b8',
    storageBucket: 'sociogram-f99b8.firebasestorage.app',
    iosBundleId: 'com.example.firebaseUrl',
  );
}
