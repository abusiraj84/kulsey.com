
import 'package:http/http.dart' show Client;
import 'package:kulsey/src/model/categoryClass/profile.dart';

class ApiServiceCategory {
  final String baseUrl = "http://192.168.1.116:8989/public/api";
  Client client = Client();

  Future<List<Category>> get() async {
    final response = await client.get("$baseUrl/category");
    if (response.statusCode == 200) {
      return categoryFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> post(Category data) async {
    final response = await client.post(
      "$baseUrl/category",
      headers: {"content-type": "application/json"},
      body: categoryToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> put(Category data) async {
    final response = await client.put(
      "$baseUrl/category/${data.id}",
      headers: {"content-type": "application/json"},
      body: categoryToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    final response = await client.delete(
      "$baseUrl/category/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
