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
    apiKey: 'AIzaSyAlL6iN_Jb4yoAM2NGYwaSipVSFgr-XbBk',
    appId: '1:798909544646:web:a7b1443dcc0c7274c27fc7',
    messagingSenderId: '798909544646',
    projectId: 'ecommerce-22230',
    authDomain: 'ecommerce-22230.firebaseapp.com',
    storageBucket: 'ecommerce-22230.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHiDH9QclzwPsmlIOmhANEKpZyGbbxCcI',
    appId: '1:798909544646:android:5fe431b295945dd1c27fc7',
    messagingSenderId: '798909544646',
    projectId: 'ecommerce-22230',
    storageBucket: 'ecommerce-22230.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCt8qe0nIWkf8lso7IOmFK3pvlOCRbkcug',
    appId: '1:798909544646:ios:1407841487504f8dc27fc7',
    messagingSenderId: '798909544646',
    projectId: 'ecommerce-22230',
    storageBucket: 'ecommerce-22230.appspot.com',
    iosClientId: '798909544646-12tn5kcpu3avqg7lg5b4m7biju12q9p3.apps.googleusercontent.com',
    iosBundleId: 'com.example.adminEcommerce',
  );
}
