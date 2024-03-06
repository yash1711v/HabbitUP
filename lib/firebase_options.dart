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
    apiKey: 'AIzaSyB7CS9_HeDUCKrYFrQYW1BoAPIIN3r7pLU',
    appId: '1:939913727709:android:8ae3e2cd004322a08cd534',
    messagingSenderId: '939913727709',
    projectId: 'habitup-870ac',
    databaseURL: 'https://habitup-870ac-default-rtdb.firebaseio.com',
    storageBucket: 'habitup-870ac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDpf3VMit51URK_tYeurCq3W_qGb_PymU',
    appId: '1:939913727709:ios:29b8a4f651c3c3178cd534',
    messagingSenderId: '939913727709',
    projectId: 'habitup-870ac',
    databaseURL: 'https://habitup-870ac-default-rtdb.firebaseio.com',
    storageBucket: 'habitup-870ac.appspot.com',
    androidClientId: '939913727709-0seaqvs90aeeqd6h9uoko535m1ti1ijh.apps.googleusercontent.com',
    iosClientId: '939913727709-u1psnfirk02mrpd3393poac9gpoa8ekm.apps.googleusercontent.com',
    iosBundleId: 'com.example.habitup',
  );
}
