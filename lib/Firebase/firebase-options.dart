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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
    /* case TargetPlatform.iOS:
        return ios;*/
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAEjkfL90_uOnNTgcDzpmeEePJ5YfgMjdI',
    appId: '1:206778038641:android:93d398626969d13a1eded0',
    messagingSenderId: '206778038641',
    projectId: 'quizapp-1d296',
  );

/* static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCf5J6K9MP6e-GVYqViPg1hfjIhbZbdiCw',
    appId: '1:606099163616:ios:6e3fc8e308131c0c1d4385',
    messagingSenderId: '606099163616',
    projectId: 'customer-service-14d72',
    iosBundleId: 'WesternLLC.WIGConnect',
    iosClientId:
    '606099163616-4s88aol2q8su76kis9ed916dtk3vua8f.apps.googleusercontent.com',
    androidClientId:
    '606099163616-g36ncpr7ps7aemb2i3grt078ppe403us.apps.googleusercontent.com',
  );*/
}