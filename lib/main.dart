import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Providers/connectivityProvider.dart';
import 'package:quizapp/Screens/SplashScreen.dart';

import 'Firebase/firebase-options.dart';
import 'Providers/QuizProvider.dart';
import 'Screens/QuizHome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,name: "Quizapp");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: QuizProvider()),
          ChangeNotifierProvider.value(value: ConnectivityProvider()),

        ],
        child:   MaterialApp(
          title: 'QUIZ APP',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}



