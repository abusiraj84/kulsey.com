import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
   return Center(
      child: Container(
        child: Text('لا يوجد لديك أي محفوظات'),
      ),
    );
  }
}