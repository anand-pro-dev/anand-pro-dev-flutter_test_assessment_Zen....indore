import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:working_app/screens/home_screen.dart';
import 'package:working_app/services/api_services.dart';
import 'package:working_app/widgets/utils/snak_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logInProvier with ChangeNotifier {
  bool loginLoading = false;
  Map<String, dynamic> data = {};

  Future<String?> loginUser(
      String email, String password, BuildContext context) async {
    loginLoading = true;
    notifyListeners();

    String result = await ApiServices()
        .postData(email, password); // Assuming postData returns a JSON string

    Map<String, dynamic> jsonResult =
        jsonDecode(result); // Parse JSON string to Map

    if (jsonResult.containsKey("token")) {
      await _saveToken(jsonResult['token']); // Save token to SharedPreferences
      loginLoading = false;
      notifyListeners();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      Utils().snackBar("Login Sucessfully", context, color: Colors.green);
    } else {
      Utils().snackBar(result.toString(), context);
    }

    loginLoading = false;
    notifyListeners();
    return null; // Return null if token is not available
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
