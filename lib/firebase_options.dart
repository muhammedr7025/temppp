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
        return macos;
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
    apiKey: 'AIzaSyDFkJMmiZtcLdTPZAu6nTji-5BtcA_OVSY',
    appId: '1:973173917724:web:31ad051244bf1cbf80f7d9',
    messagingSenderId: '973173917724',
    projectId: 'app-53e53',
    authDomain: 'app-53e53.firebaseapp.com',
    storageBucket: 'app-53e53.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkRdW8ud8Of_WChIXl9DFlcsXdKp-2G_8',
    appId: '1:973173917724:android:bbdf38c785e6561780f7d9',
    messagingSenderId: '973173917724',
    projectId: 'app-53e53',
    storageBucket: 'app-53e53.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCr1bUVleBdIoWkwt9bQfnowEfvcEmcV7Q',
    appId: '1:973173917724:ios:5394989542317c6880f7d9',
    messagingSenderId: '973173917724',
    projectId: 'app-53e53',
    storageBucket: 'app-53e53.appspot.com',
    iosClientId: '973173917724-tb1uf259aagt9n4aogh3e1rr4dp3pkh7.apps.googleusercontent.com',
    iosBundleId: 'com.example.airPollution',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCr1bUVleBdIoWkwt9bQfnowEfvcEmcV7Q',
    appId: '1:973173917724:ios:5394989542317c6880f7d9',
    messagingSenderId: '973173917724',
    projectId: 'app-53e53',
    storageBucket: 'app-53e53.appspot.com',
    iosClientId: '973173917724-tb1uf259aagt9n4aogh3e1rr4dp3pkh7.apps.googleusercontent.com',
    iosBundleId: 'com.example.airPollution',
  );
}