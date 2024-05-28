import 'package:flutter/material.dart';
import 'package:working_app/provider/home_provider.dart';
import 'package:working_app/provider/login_provider.dart';
import 'package:working_app/widgets/app_button.dart';
import 'package:working_app/widgets/rounded_container.dart';
import 'package:provider/provider.dart';

import '../widgets/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pswd = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).homeUserData();
    AppColor.setAmberStatusBar();
  }

  String? _validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(emailPattern);

    if (value == null || value.isEmpty) {
      return 'Enter Email';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<logInProvier>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "inLoggen",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        "Log in met uw inloggengenvens",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "email : eve.holt@reqres.in",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Password : pistol",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 50),
                      shadowContainer(
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: "Email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber.shade500),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: _validateEmail,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        child: shadowContainer(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: pswd,
                            decoration: InputDecoration(
                              hintText: "Password",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.amber.shade500),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        loading: provider.loginLoading,
                        title: 'Login',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            var data = {
                              "email": email.text,
                              "password": pswd.text
                            };
                            provider.loginUser(email.text, pswd.text, context);
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Do you want to create an ? ",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Sign up",
                                  style: TextStyle(fontSize: 18))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
