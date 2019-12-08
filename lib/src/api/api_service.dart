import 'package:http/http.dart' show Client;
import 'package:kulsey/src/model/profile.dart';

class ApiService {
  final String baseUrl = "http://api.bengkelrobot.net:8001/api";
  Client client = Client();

  Future<List<Profile>> get() async {
    final response = await client.get("$baseUrl/profile");
    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> post(Profile data) async {
    final response = await client.post(
      "$baseUrl/profile",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> put(Profile data) async {
    final response = await client.put(
      "$baseUrl/profile/${data.id}",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> delete(int id) async {
    final response = await client.delete(
      "$baseUrl/profile/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
