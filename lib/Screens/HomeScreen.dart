import 'package:flutter/material.dart';
import 'package:kulsey/Screens/favorite.dart';
import 'package:kulsey/Screens/profile.dart';
import 'package:kulsey/Screens/search.dart';
import 'package:kulsey/services/auth_service.dart';

import 'dashboard.dart';
import 'package:kulsey/utileties/globals.dart' as global;

class Home extends StatefulWidget {

  Home({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final AuthService auth;
  final VoidCallback logoutCallback;
  final String userId;
  static final String id = 'home_screen';
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed
 

  int currentTab = 3; // to keep track of active tab index
  final List<Widget> screens = [
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
    Dashboard(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard(); // Our first view in viewport


@override
  void initState() {
    super.initState();
   

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.backgroundcolor,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: global.firstcolor,
        child: Icon(Icons.add,color: global.secondcolor,),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        color: global.secondcolor,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfileScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 0 ? global.firstcolor : Colors.grey[500],
                        ),
                        Text(
                          'العضوية',
                          style: TextStyle(fontSize: 14,
                            color: currentTab == 0 ? global.firstcolor : Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            FavoriteScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          color: currentTab == 1 ? global.firstcolor : Colors.grey[500],
                        ),
                        Text(
                          'المفضلة',
                          style: TextStyle(fontSize: 14,
                            color: currentTab == 1 ? global.firstcolor : Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            SearchScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: currentTab == 2 ? global.firstcolor : Colors.grey[500],
                        ),
                        Text(
                          'بحث',
                          style: TextStyle(fontSize: 14,
                            color: currentTab == 2 ? global.firstcolor : Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                             Dashboard(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 3 ? global.firstcolor : Colors.grey[500],
                        ),
                        Text(
                          'استكشف',
                          style: TextStyle(fontSize: 14,
                            color: currentTab == 3 ? global.firstcolor : Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
