import 'package:flutter/material.dart';
import 'package:kulsey/Animation/FadeAnimation.dart';
import 'package:kulsey/Screens/Login/login_screen.dart';
import 'package:kulsey/services/auth_service.dart';
import 'package:kulsey/utileties/globals.dart' as global;
import 'package:page_transition/page_transition.dart';
class SelectCountry extends StatefulWidget {
  SelectCountry({this.auth, this.loginCallback});

  final AuthService auth;
  final VoidCallback loginCallback;

  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
      image: AssetImage('assets/images/background.jpg'),
      fit: BoxFit.cover
            )
          ),
            width: MediaQuery.of(context).size.width ,
          child: Container(
            decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          global.statusbarcolor.withOpacity(0.95),
          Colors.black.withOpacity(0.4),
        ],
        begin: Alignment.center,
        end: Alignment.topCenter
      )
            ),
            child: Column(
      children: <Widget>[
        SizedBox(
          height: 200,
        ),
       FadeAnimation(0.5, Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: global.secondcolor,
          borderRadius: BorderRadius.circular(12),
          ),
            child: Text(
          'كل شي',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),),
        SizedBox(
          height: 30,
        ),
        FadeAnimation(0.6, Text(
          'اختر الدولة',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
        ),),
      FadeAnimation(0.6,   Text('من فضلك قم باختيار الدولة التي تقيم بها',style: TextStyle(color: Colors.white),),),
        SizedBox(
          height: 30,
        ),
            countries(delay:0.7,country:'تركيا',icon: 'assets/images/turkey.png'),
            countries(delay:0.9,country:'السعودية',icon: 'assets/images/ksa.png'),
            countries(delay:1.1,country:'الإمارات',icon: 'assets/images/uae.png'),
            countries(delay:1.3,country:'قطر',icon: 'assets/images/qatar.png'),
            countries(delay:1.5,country:'مصر',icon: 'assets/images/egypt.png'),
        SizedBox(
          height: 10,
        ),
                
        SizedBox(
          height: 10,
        ),
                 
        SizedBox(height: 100,),
        Text('جميع الحقوق محفوظة لدى',style:TextStyle(color:Colors.white)),
        Text('www.kulsey.com',style:TextStyle(color:global.secondcolor,letterSpacing: 5,height: 1,fontSize: 13,)),
      ],
            ),
          ),
        ),
      
    );
  }

  countries({double delay, String country,String icon}) {
    return          FadeAnimation(delay,   InkWell(
                            child: Column(
                              children: <Widget>[
                                Container(
                 //width: MediaQuery.of(context).size.width *0.7,
                 padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                 decoration: BoxDecoration(
                   border: Border.all(color:  global.secondcolor),borderRadius: BorderRadius.circular(10)

                 ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(country,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(icon,width: 20,)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
                              ],
                            ),
                onTap: (){
                   Navigator.push(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.center, child: LoginScreen(auth: AuthService())));
                },
              ),);
  }

 
}
