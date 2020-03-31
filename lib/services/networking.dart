import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl;

  HttpService(this.baseUrl);

  Future get(String url) async {
    try {
      http.Response response = await http.get('$baseUrl$url');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (err) {
      print('Something error when getting data from $baseUrl$url');
    }
  }
}
