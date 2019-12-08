//تحويل الجيسون لكلاس here https://app.quicktype.io/

import 'dart:convert';

class Profile {
  int id;
  String name;
  String email;
  int age;

  Profile({
    this.id = 0,
    this.name,
    this.email,
    this.age,
  });
  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "age": age,
      };

//////////////////////////////// هنا يجب عليك تغيير المتغيرات حسب الكلاس الجديد
  @override
  String toString() {
    return 'Profile{id: $id, name: $name, email: $email, age: $age}';
  }
}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}



String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
