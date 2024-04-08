import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mnm/View/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyD9mu4RO3j6TAUMGgoZdoEWbTp4igP4LFY',
          appId: '1:991942880159:web:d013d1707801eb7d1dabaa',
          messagingSenderId: '991942880159',
          projectId: 'warehousebd-3fa6b',
          authDomain: 'warehousebd-3fa6b.firebaseapp.com',
          storageBucket: 'warehousebd-3fa6b.appspot.com',
          databaseURL: 'https://warehousebd-3fa6b-default-rtdb.firebaseio.com/', // Add this line
        ));

  } else {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'start',
    routes: {
      'start': (context) => const Login(),
    },
  ));
}
