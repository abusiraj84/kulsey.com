import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kulsey/Screens/HomeScreen.dart';
import 'package:kulsey/models/user_data.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

    Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }
Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

///// لإعادة كلمة المرور
      static void resetPassword(BuildContext context,String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
       Navigator.pop(context);
        Fluttertoast.showToast(
            msg: 'لقد تم إرسال رسالة تعيين كلمة جديدة ',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
    }catch(e){
      print(e.message);
      var _badlyFormatted = 'The email address is badly formatted.';
      var _notAvailable =
          'There is no user record corresponding to this identifier. The user may have been deleted.';
       if (e.message == _badlyFormatted) {
        Fluttertoast.showToast(
            msg: 'هناك خطأ في كتابة البريدالإلكتروني',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      
      }else if (e.message == _notAvailable) {
        Fluttertoast.showToast(
            msg: 'نعتذر البريد الذي أدخلته غير متوفر',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }

    }}



// تسجبل عضو جديد 
  static void signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          
        
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        
        _firestore.collection('/users').document(signedInUser.uid).setData({
          'name': name,
          'email': email,
          'profileImageUrl': '',
        });

        // Provider.of<UserData>(context).currentUserId = signedInUser.uid;
                                Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, alignment: Alignment.center, child: Home()));

    
      }
    } catch (e) {
      // print(e.message);

     print(e);
         var _notAvailable =
          'The email address is already in use by another account.';
      var _badlyFormatted = 'The email address is badly formatted.';
      var _blocked = 'The user account has been disabled by an administrator.';
     if (e.message == _notAvailable) {
        Fluttertoast.showToast(
            msg: 'نعتذر البريد الذي أدخلته غير متوفر',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.message == _badlyFormatted) {
        Fluttertoast.showToast(
            msg: 'هناك خطأ في كتابة البريدالإلكتروني',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      
      }else if (e.message == _blocked) {
        Fluttertoast.showToast(
            msg: 'لقد تم حظرك من الدخول',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      } 

    }
  }


/// تسجيل خروج
  static void logout(BuildContext context) {
    _auth.signOut();
  }



// تسجيل دخول
  static void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.message);

      var _noUser =
          'There is no user record corresponding to this identifier. The user may have been deleted.';
      var _badlyFormatted = 'The email address is badly formatted.';
      var _invalidPassword = 'The password is invalid or the user does not have a password.';
      var _blocked = 'The user account has been disabled by an administrator.';
      if (e.message == _noUser) {
        Fluttertoast.showToast(
            msg: 'لا يوجد هكذا بريد مسجل لدينا',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.message == _badlyFormatted) {
        Fluttertoast.showToast(
            msg: 'هناك خطأ في كتابة البريدالإلكتروني',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }else if (e.message == _invalidPassword) {
        Fluttertoast.showToast(
            msg: 'كلمة المرور خاطئة يرجى إعادة المحاولة',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }else if (e.message == _blocked) {
        Fluttertoast.showToast(
            msg: 'لقد تم حظرك من الدخول',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIos: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }


    }


  }

//////

}
