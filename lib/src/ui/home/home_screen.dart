
import 'package:flutter/material.dart';
import 'package:kulsey/services/auth_service.dart';
import 'package:kulsey/src/api/api_service.dart';
import 'package:kulsey/src/model/profile.dart';
import 'package:kulsey/src/ui/formadd/form_add_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BuildContext context;
  ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.exit_to_app,), onPressed:()=>  AuthService.logout(context),
      ),),
      body: SafeArea(
      child: FutureBuilder(
        future: apiService.get(),
        builder: (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "حدث خطأ ما: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Profile> profiles = snapshot.data;
            return _buildListView(profiles);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),

    );
  }

  Widget _buildListView(List<Profile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Profile profile = profiles[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      profile.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(profile.email),
                    Text(profile.age.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("تحذير"),
                                    content: Text(
                                        "هل أنت متأكد من قيامك لحذف ${profile.name}?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("نعم"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          apiService
                                              .delete(profile.id)
                                              .then((isSuccess) {
                                            if (isSuccess) {
                                              setState(() {});
                                              Scaffold.of(this.context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "تم الحذف بنجاج")));
                                            } else {
                                              Scaffold.of(this.context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "فشلت عملية الحذف")));
                                            }
                                          });
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("لا"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            "حذف",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return FormAddScreen(profile: profile);
                            }));
                          },
                          child: Text(
                            "تعديل",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),

                    
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: profiles.length,
      ),
    );
  }
}
