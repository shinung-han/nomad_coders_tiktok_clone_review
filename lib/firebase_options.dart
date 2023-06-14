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
    apiKey: 'AIzaSyAIGLGswuXslAaOzmsvGPwPGUH7imI9gAs',
    appId: '1:505600973269:web:2482aac347a3bec107855c',
    messagingSenderId: '505600973269',
    projectId: 'nomad-tiktok-b',
    authDomain: 'nomad-tiktok-b.firebaseapp.com',
    storageBucket: 'nomad-tiktok-b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtWFzSjTynWSKzwHNVSo7E85ghcjMAp_s',
    appId: '1:505600973269:android:a21214d562e8a64b07855c',
    messagingSenderId: '505600973269',
    projectId: 'nomad-tiktok-b',
    storageBucket: 'nomad-tiktok-b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9gTssUQ2-NbTU0hAVRob2mULp7I7Db6Q',
    appId: '1:505600973269:ios:ed08611035812cb207855c',
    messagingSenderId: '505600973269',
    projectId: 'nomad-tiktok-b',
    storageBucket: 'nomad-tiktok-b.appspot.com',
    iosClientId:
        '505600973269-red48ngdj3325rdni67s5b1limdn13h1.apps.googleusercontent.com',
    iosBundleId: 'com.example.tiktokClone2.RunnerTests',
  );
}