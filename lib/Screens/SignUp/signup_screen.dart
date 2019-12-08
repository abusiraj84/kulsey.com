import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulsey/Screens/Login/login_screen.dart';
import 'package:kulsey/services/auth_service.dart';
import 'package:kulsey/utileties/globals.dart' as global;
import 'package:page_transition/page_transition.dart';



class SignupScreen extends StatefulWidget {
  SignupScreen({this.auth,this.logoutCallback});
  final AuthService auth;
  final VoidCallback logoutCallback;

static final String id = 'signup_screen';


  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // Logging in the user w/ Firebase
      AuthService.signUpUser(context, _name, _email, _password);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.secondcolor,
      body: SingleChildScrollView(
        child: Container(

          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back5.jpg'),
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
          
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'كل شي',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                          labelText: 'الإسم',
                        ),
                        validator: (input) => input.trim().isEmpty
                            ? 'من فضلك ادخل اسم صالح'
                            : null,
                        onSaved: (input) => _name = input,
                      ),
                    ),
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
                    Container(
                      width: 250,
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: _submit,
                        color: Colors.green,
                        child: Text(
                          'سجل العضوية',
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
                        onPressed: () =>  Navigator.push(context, PageTransition(type: PageTransitionType.upToDown, alignment: Alignment.center, child: LoginScreen())),
                        color: Colors.black,
                        child: Text(
                          'عودة لتسجيل الدخول',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),)
    );
  }
}
