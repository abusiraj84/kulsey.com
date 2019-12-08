import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kulsey/Screens/Login/login_screen.dart';
import 'package:kulsey/services/auth_service.dart';
import 'package:kulsey/utileties/globals.dart' as global;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final AuthService auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeeeeee),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //appbar
              Container(
                padding: EdgeInsets.all(20),
                height: 100,
                color: global.secondcolor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      size: 50,
                      color: global.firstcolor,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('أهلا بك في كل شي',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(' سجل دخولك للتمتع بكافة المزايا',
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
              //signin signup area
              Container(
                padding: EdgeInsets.all(10),
                height: 120,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: global.secondcolor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.account_circle,
                            size: 20,
                            color: global.firstcolor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('تسجيل الدخول')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height:40,
                          width:40,
                          decoration: BoxDecoration(
                            color: global.secondcolor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 20,
                            color: global.firstcolor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('اشترك الآن')
                      ],
                    ),
                  ],
                ),
              ),
            Expanded(
              child: ListView(
                children: <Widget>[
                    SizedBox(height: 10),
              //title text
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'الإعدادات',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              //custom listtile
              Container(
                color: Colors.white,
                height: 150,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.globeAmericas),
                          SizedBox(width: 15.0),
                        Text('البلد',style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                        Spacer(),
                        Image.asset(
                          'assets/images/turkey.png',
                          height: 30,
                        ),
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                        )
                      ],
                    ),
                    
                    Divider(),   Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.flag),
                          SizedBox(width: 15.0),
                        Text('اللغة',style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                        Spacer(),
                        Text('العربية'),
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //title text
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'تواصل معنا',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              //custom listtile
                 Container(
                color: Colors.white,
                height: 150,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.whatsapp),
                          SizedBox(width: 15.0),
                        Text('راسلنا على WhatsApp',style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                        Spacer(),
                        
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                        )
                      ],
                    ),
                    
                    Divider(),   Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.phoneAlt),
                          SizedBox(width: 15.0),
                        Text('الاتصال بنا',style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                        Spacer(),
                      
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //socail media
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.grey.shade700,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.grey.shade700,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.grey.shade700,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.grey.shade700,
                      ),
                      onPressed: () {}),
                ],
              )
                ],
              ),
            )
            ],
          ),
        ));
  }

  signOut() {
    AuthService.logout(context);
    setState(() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      }));
    });
  }
}
