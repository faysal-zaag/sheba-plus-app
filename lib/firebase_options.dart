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
    apiKey: 'AIzaSyCfZYBMSx8_NbTXQPLVYo87jupZxnFrpUE',
    appId: '1:836476357749:android:c2cca367cef18648b7bc3c',
    messagingSenderId: '836476357749',
    projectId: 'sheba-plus',
    storageBucket: 'sheba-plus.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvRZB8Z0eXEGKxZVKhy2pJ9ru8PqGtM3U',
    appId: '1:836476357749:ios:cf2587e6ad5f5c95b7bc3c',
    messagingSenderId: '836476357749',
    projectId: 'sheba-plus',
    storageBucket: 'sheba-plus.firebasestorage.app',
    androidClientId: '836476357749-h2p8p7ucrheupoi2p36g1q72drlb9r53.apps.googleusercontent.com',
    iosClientId: '836476357749-c7nf87bm74k6jor3d33o1ns9e9phll28.apps.googleusercontent.com',
    iosBundleId: 'com.shebaplus.shebaPlus',
  );
}
