import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:working_app/provider/home_provider.dart';
import 'package:working_app/screens/login_screen.dart';
import 'package:working_app/services/api_calls.dart';
import 'package:working_app/widgets/rounded_container.dart';
import 'package:provider/provider.dart';
import 'package:working_app/widgets/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AppColor.setBlueStatusBar();
    // homeUserData();
    Provider.of<DataProvider>(context, listen: false).homeUserData();
  }

  // homeUserData() async {
  //   var data = await FatchAPI().getUserdata();
  // }
  void removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    // Navigate to the login screen after removing the token
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
    AppColor.setAmberStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                removeToken();
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Consumer<DataProvider>(
        builder: (context, provider, child) {
          if (provider.homeLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.users.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                              child: roundedHomeContainer(
                            name: provider.users[index]['first_name'] ?? "",
                            lastName: provider.users[index]['last_name'] ?? "",
                            email: provider.users[index]['email'] ?? "",
                            image: provider.users[index]['avatar'] ?? "",
                          ));
                        })
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
