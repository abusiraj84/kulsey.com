//تحويل الجيسون لكلاس here https://app.quicktype.io/

import 'dart:convert';

class Category {
    String id;
    String name;
    String icon;

    Category({
        this.id,
        this.name,
        this.icon,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
    };

//////////////////////////////// هنا يجب عليك تغيير المتغيرات حسب الكلاس الجديد
  @override
  String toString() {
    return 'Category{id: $id, name: $name, icon: $icon}';
  }
}

List<Category> categoryFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Category>.from(data.map((item) => Category.fromJson(item)));
}



String categoryToJson(Category data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
