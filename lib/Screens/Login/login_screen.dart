import 'package:flutter/material.dart';
import 'package:kulsey/Screens/HomeScreen.dart';
import 'package:kulsey/Screens/Login/forgetpass_screen.dart';
import 'package:kulsey/Screens/SignUp/signup_screen.dart';
import 'package:kulsey/services/auth_service.dart';

import 'package:kulsey/utileties/globals.dart' as global;
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
    LoginScreen({this.auth, this.loginCallback});

  final AuthService auth;
  final VoidCallback loginCallback;



  static final String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  String _errorMessage;
  bool _isLoading ;
  bool _isLoginForm;

String _userId = "";

  @override


  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });

   Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child: 
   Home(
      userId: _userId,
            auth: widget.auth,
            logoutCallback: logoutCallback,
   )
   ));
  }
  
bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
    });
    if (validateAndSave()) {
      String userId = "";
            _errorMessage = "";
      _isLoading = true;

      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
           loginCallback();

        } else {
          // userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          // _errorMessage = e.message;
          // _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }
  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

    void logoutCallback() {
    setState(() {
      // authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: global.secondcolor,
      body: SingleChildScrollView(
        
        child: Container(

          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back3.jpg'),
            fit: BoxFit.cover
          )
        ),
          width: MediaQuery.of(context).size.width ,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.8),
                Colors.white.withOpacity(0.8),
              ],
              begin: Alignment.center,
              end: Alignment.topCenter
            )
          ),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: global.firstcolor,
                borderRadius: BorderRadius.circular(12),
                ),
                  child: Text(
                'كل شي',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: global.secondcolor),
              )),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'البريد الإلكتروني',
                        ),
                        validator: (input) => !input.contains('@')
                            ? 'من فضلك ادخل بريد صالح'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'كلمة المرور',
                        ),
                        validator: (input) => input.length < 6
                            ? 'كلمة المرور يجب أن تكون على الأقل ٦ حروف'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Text('هل نسيت كلمة المرور؟'),
                      onTap: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, alignment: Alignment.center, child: ForgetpassScreen()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: validateAndSubmit,
                        color: global.firstcolor,
                        child: Text(
                          'تسجيل دخول',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () =>
                            Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, alignment: Alignment.center, child: SignupScreen())),
                        color: Color(0xffef5350),
                        child: Text(
                          'عضوية جديدة',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              showCircularProgress(),
            ],
          ),
        ),
      ),
    ));
  }
}
