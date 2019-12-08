import 'package:flutter/material.dart';
import 'package:kulsey/Screens/SignUp/signup_screen.dart';
import 'package:kulsey/services/auth_service.dart';
import 'package:kulsey/utileties/globals.dart' as global;
import 'package:page_transition/page_transition.dart';

class ForgetpassScreen extends StatefulWidget {
  const ForgetpassScreen({Key key}) : super(key: key);

  @override
  _ForgetpassScreenState createState() => _ForgetpassScreenState();
}

class _ForgetpassScreenState extends State<ForgetpassScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.secondcolor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black) ,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      
      body: SingleChildScrollView(
        child: Container(

          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back6.jpg'),
            fit: BoxFit.cover
          )
        ),
          width: MediaQuery.of(context).size.width ,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.7),
                Colors.white.withOpacity(0.9),
              ],
              begin: Alignment.center,
              end: Alignment.topCenter
            )
          ),
          
          child:  Form(
                  key: _formKey,
                child: Column(
            children: <Widget>[
               SizedBox(
                height: 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Text(
                  'أدخل البريد الإلكتروني الخاص بك وسوف نرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey.shade600),
                  textAlign: TextAlign.right,
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  onPressed: _submit,
                  color: global.firstcolor,
                  child: Text(
                    'إعادة تعيين كلمة المرور',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w200),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: (){
                  
                      Navigator.push(context, PageTransition(type: PageTransitionType.upToDown, alignment: Alignment.center, child: SignupScreen()));

                      },
                      child: Text(
                        'اشترك الآن',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),))
    );
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.resetPassword(context,_email);
     

    }
  }
}
