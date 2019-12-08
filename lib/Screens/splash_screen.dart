import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kulsey/Screens/HomeScreen.dart';
import 'package:kulsey/Screens/root_screen.dart';
import 'package:kulsey/Screens/select_country.dart';
import 'package:kulsey/services/auth_service.dart';

import 'package:kulsey/utileties/globals.dart' as global;
import 'package:page_transition/page_transition.dart';
import 'Login/login_screen.dart';

class SplashScreen extends StatefulWidget {

 SplashScreen({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final AuthService auth;
  final VoidCallback logoutCallback;
  final String userId;
  static final String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
    AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override


  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {


    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });

    Timer(Duration(seconds: 2), () { 
         switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
  

     Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: RootPage(auth:  AuthService())));

        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
     return Home(
            userId: widget.userId,
            auth: widget.auth,
            logoutCallback: widget.logoutCallback,
          );
     }));
          
        } else
          return buildWaitingScreen();
        break;
      default:
        return buildWaitingScreen();
    }
     
 
      });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back8.jpg'),
            fit: BoxFit.cover
          )
        ),
          width: MediaQuery.of(context).size.width ,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                global.firstcolor.withOpacity(0.8),
                global.firstcolor.withOpacity(0.8),
              ],
              begin: Alignment.center,
              end: Alignment.topCenter
            )
          ),
          
          child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: Icon(
                          Icons.favorite,
                          color: global.secondcolor,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'كل شي',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: global.secondcolor,
                      
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                        'www.kulsey.com',
                        style: TextStyle(
                          letterSpacing: 5,
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            fontSize: 15.0),
                      )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      )));
  }
}
