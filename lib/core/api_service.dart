import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "http://localhost:3000";

  static Future<String?> loginBackend(
      String firebaseToken,
      String email) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "firebaseToken": firebaseToken,
        "email": email
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["jwt"];
    }

    return null;
  }

  static Future<List<dynamic>> getProducts() async {
    final response = await http.get(
      Uri.parse("$baseUrl/products"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }
}