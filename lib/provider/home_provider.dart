 
import 'package:flutter/cupertino.dart';

import 'package:working_app/services/api_services.dart';
 

class DataProvider with ChangeNotifier {
  bool homeLoading = false;
  bool signLoading = false;

  List users = [];

  Future<dynamic> homeUserData() async {
    homeLoading = true;

    var data = await ApiServices().getUsers();
    users = data['data'];
    // debugPrint(users.toString());
    homeLoading = false;
    notifyListeners();
  }
}
