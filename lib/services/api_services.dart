import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart ' as http;

class ApiServices {
  var client = http.Client();

  String baseUrl = 'https://reqres.in/api/';

  Future<dynamic> getUsers() async {
    final response = await http.get(Uri.parse('${baseUrl}users'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      // log(result.toString());
      return result;
    } else {
      log(response.toString());
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> login(object) async {
    var url = Uri.parse('https://reqres.in/api/login');
    // var _payload = json.encode(object);
    var _payload = object;
    // var _headers = {'Content-Type': 'application/json'};

    var response = await client.post(
      url,
      body: _payload,
    );
    // var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      var result = jsonDecode(response.body);
      // log(result.toString());
      return result;
    } else {
      log(response.toString());
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> postData(email, password) async {
    final url = Uri.parse('${baseUrl}login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email, 'password': password});

    final response = await http.post(url, headers: headers, body: body);
    log(response.body.toString());
    if (response.statusCode == 200) {
      print('Data Sending Success.');
      return response.body;
    } else {
      print('Hata: ${response.statusCode}');
      return response.body;
    }
  }
}
