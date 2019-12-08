
import 'package:flutter/material.dart';
import 'package:kulsey/src/api/category/api_service.dart';
import 'package:kulsey/src/model/categoryClass/profile.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  BuildContext context;
  ApiServiceCategory apiServiceCategory;

  @override
  void initState() {
    super.initState();
    apiServiceCategory = ApiServiceCategory();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SafeArea(
      child: FutureBuilder(
        future: apiServiceCategory.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  Category category = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(color: Color(0xfff35437),borderRadius: BorderRadius.circular(12),),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(category.name),
                          ],
                        )
                      )
                    ),
                  );
                },
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
