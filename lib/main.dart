
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kulsey/Screens/HomeScreen.dart';
import 'package:kulsey/Screens/Login/login_screen.dart';
import 'package:kulsey/Screens/root_screen.dart';
import 'package:kulsey/Screens/splash_screen.dart';
import 'package:kulsey/services/auth_service.dart';

import 'package:provider/provider.dart';


import 'Screens/SignUp/signup_screen.dart';
import 'models/user_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          return Home();
        }else{
          return LoginScreen();
        
        }
      },

    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(auth:  AuthService()),
      home: SplashScreen(auth:  AuthService()),

      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        Home.id: (context) => Home(),
        SplashScreen.id: (context) => SplashScreen()
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar'), // English
      ],
      theme: ThemeData(
        fontFamily: 'Questv',

      ),

      // theme: ThemeData.dark(),
    );
  }
}
