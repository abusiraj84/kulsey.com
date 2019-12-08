import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:kulsey/utileties/globals.dart' as global;

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  
  bool isSelected = false;

  Future<Map> getWeather() async {
    String myUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=Istanbul,turkey&appid=dfa1c2727d2cfa2b91496016dc6bc5af&units=metric';
    http.Response response = await http.get(myUrl);
    return json.decode(response.body);
  }

  myWeatherFinal() {
    return FutureBuilder(
      future: getWeather(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Map content = snapshot.data;
          var image = "assets/images/${content['weather'][0]['icon']}\.png";
          return Row(
            children: <Widget>[
              Text(
                content['main']['temp'].toStringAsFixed(0) + '°c',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                    textAlign: TextAlign.center,
              ),
               //Image.asset("assets/images/${content['weather'][0]['icon']}.png",width: 25,)
                Image.asset(image,width: 30,)
            ],
          );
        } else {
          return Text('');
        }
      },
    );
  }

  Future<Map> getLira() async {
    String myUrl = 'https://finans.truncgil.com/today.json';
    http.Response response = await http.get(myUrl);
    return json.decode(response.body);
  }

  usdToLire() {
    return FutureBuilder(
      future: getLira(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Map quotes = snapshot.data;

          var dollarSatis ='';
              // Decimal.parse(quotes['ABD DOLARI']['Satış']).toStringAsFixed(2);

          var euroSatis ='';
              // Decimal.parse(quotes['EURO']['Satış']).toStringAsFixed(2);

          var altin ='';
          //  quotes['Gram Altın']['Satış'];

          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(color:global.secondcolor,borderRadius: BorderRadius.circular(12),),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                 
                                  children: <Widget>[
                                    myWeatherFinal(),
                                  ]),
                              Text(
                                'إسطنبول',
                                style: TextStyle(color: Colors.white,
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    ///
                    Container(
                       padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'دولار',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold,color: global.firstcolor,),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                dollarSatis.toString() + ' ₺',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold,color: global.secondcolor),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          SizedBox(width: 5,),
                          Container(
                             height: 45,
                            alignment: Alignment.center,
                            child: Icon(
                              FontAwesomeIcons.dollarSign,
                              size: 20,
                              color: global.firstcolor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///

                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12),),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'يورو',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold,color: global.firstcolor,),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                euroSatis.toString() + ' ₺',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold,color: global.secondcolor),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          SizedBox(width: 5,),
                          Container(
                             height: 45,
                            alignment: Alignment.center,
                            child: Icon(
                              FontAwesomeIcons.euroSign,
                              size: 20,color: global.firstcolor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///

                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'الذهب',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold,color: global.firstcolor,),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                altin.toString() + ' ₺',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold,color: global.secondcolor),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                           SizedBox(width: 5,),
                          Container(
                            height: 45,
                            alignment: Alignment.center,
                            child: Icon(
                              FontAwesomeIcons.coins,
                              size: 20,
                              color: global.firstcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                
              ],
            ),
          );
        } else {
          return Text('');
        }
      },
    );
  }

  test() async {
    Map myinfo = await getLira();
    print(myinfo);
  }

  @override
  void initState() {

    test();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(global.statusbarcolor);

    return SafeArea(
      child: Scaffold(

        backgroundColor: global.backgroundcolor,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      color: global.secondcolor,
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage(
                                      'https://scontent.fsaw1-6.fna.fbcdn.net/v/t1.0-9/50110061_2134320890121979_165856286758404096_n.jpg?_nc_cat=109&_nc_ohc=eYGRND6fTXAAQntFTm094R3CH6kYT0LqWf3fixDDX0kCjcCTW0-NhKrfw&_nc_ht=scontent.fsaw1-6.fna&oh=0a3e156d9f3c197cee2828f71b9839b7&oe=5E7D7508'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: global.statusbarcolor.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: global.firstcolor),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                global.firstcolor,
                                            blurRadius: 0.5,
                                            spreadRadius: 0.2)
                                      ]),
                                  child: Text(
                                    'كل \n شي',
                                    style: TextStyle(
                                        color: global.secondcolor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/menu.png',
                                  width: 35,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.blueGrey,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.tune,
                                    color: Colors.blueGrey,
                                  ),
                                  hintText: 'إبحث عن ....',
                                  hintStyle: TextStyle(fontSize: 15),
                                  contentPadding: EdgeInsets.zero,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Card(
                      color: global.firstcolor,
                      elevation: 1,
                      margin: EdgeInsets.all(0),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: usdToLire()),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 1,
                      margin: EdgeInsets.all(0),
                      child: Container(
                        height: 100,
                        color: Colors.white,
                        padding:
                            EdgeInsets.only(top: 20, bottom: 20, right: 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            categories(
                                title: 'عقارات',
                                image: 'assets/images/apartment.png',),
                                
                            categories(
                                title: 'سيارات',
                                image: 'assets/images/car.png'),
                            categories(
                                title: 'مستعمل',
                                image: 'assets/images/secondhand.png'),
                            categories(
                                title: 'جديد', image: 'assets/images/new.png'),
                            categories(
                                title: 'رحلات',
                                image: 'assets/images/trips.png'),
                            categories(
                                title: 'مترجم',
                                image: 'assets/images/translation.png'),
                            categories(
                                title: 'وظائف',
                                image: 'assets/images/jobs.png'),
                            categories(
                                title: 'مطاعم',
                                image: 'assets/images/restaurant.png'),
                            categories(
                                title: 'خدمات',
                                image: 'assets/images/service.png'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 1,
                      margin: EdgeInsets.all(0),
                      child: Container(
                        height: 220,
                        alignment: Alignment.topRight,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'آخر العروض',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'المزيد',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 140,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  lastoffers(
                                      imageUrl:
                                          'https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  lastoffers(
                                      imageUrl:
                                          'https://images.pexels.com/photos/3158128/pexels-photo-3158128.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  lastoffers(
                                      imageUrl:
                                          'https://images.pexels.com/photos/2258248/pexels-photo-2258248.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  lastoffers(
                                      imageUrl:
                                          'https://images.pexels.com/photos/2765872/pexels-photo-2765872.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  lastoffers(
                                      imageUrl:
                                          'https://images.pexels.com/photos/3098847/pexels-photo-3098847.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  lastoffers(
                                      imageUrl:
                                          'https://images.pexels.com/photos/3098734/pexels-photo-3098734.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                  lastoffers(
                                      imageUrl:
                                          'https://images.pexels.com/photos/2815155/pexels-photo-2815155.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  categories({title, image}) {
    return Container(
      height: 80,
      width: 80,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: global.firstcolor)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          Image.asset(
            image,
            width: 23,
            color: global.firstcolor,
          ),
          Text(title, style: TextStyle(color: global.firstcolor, fontSize: 12))
        ],
      ),
    );
  }

  lastoffers({imageUrl}) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(left: 5, right: 10, top: 0, bottom: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          imageUrl,
                        ),
                        fit: BoxFit.cover),
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.2),
                          ]),
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      size: 12,
                      color: Colors.red,
                    ),
                  )),
              Positioned(
                  left: 5,
                  top: 5,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: global.secondcolor),
                    child: Icon(
                      Icons.share,
                      size: 12,
                      color: global.firstcolor,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            child: Text(
              'شقة إيجار ٢ + ١ بشيشلي وفيلا كبيرة ',
              style: TextStyle(fontSize: 12, height: 1.3),
            ),
          )
        ],
      ),
    );
  }
}
