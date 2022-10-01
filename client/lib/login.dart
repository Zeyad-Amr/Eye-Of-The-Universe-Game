import 'dart:convert';

import 'package:client/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '', pass = '';
  bool islooged = false;
  String txt = 'Register';
  @override
  void initState() {
    super.initState();
    // getData();
  }

  // getData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? username = prefs.getString('username');
  //   if (username == null) {
  //     islooged = false;
  //   } else {
  //     islooged = true;
  //     txt = 'Login';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                txt,
                style: const TextStyle(fontSize: 50),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      username = val;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(
                      color: Colors.black, decorationColor: Colors.black),
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black, decorationColor: Colors.black),
                      hintStyle: TextStyle(
                          color: Colors.black, decorationColor: Colors.black),
                      labelText: 'Username',
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.alternate_email_rounded,
                          color: Colors.blue),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      pass = val;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(
                      color: Colors.black, decorationColor: Colors.black),
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(
                          color: Colors.black, decorationColor: Colors.black),
                      hintStyle: TextStyle(
                          color: Colors.black, decorationColor: Colors.black),
                      labelText: 'Password',
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock, color: Colors.blue),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      )),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15)),
                  onPressed: () async {
                    var response = await http.post(
                      Uri.parse(
                          "https://protected-dawn-08393.herokuapp.com/userInfo?username=$username&password=$pass"),
                    );

                    // if (islooged) {
                    //   response = await http.get(
                    //     Uri.parse(
                    //         "https://protected-dawn-08393.herokuapp.com/userInfo?username=$username&password=$pass"),
                    //   );
                    // } else {
                    //   response
                    // }

                    debugPrint(response.statusCode.toString());
                    var decodedData = json.decode(response.body);
                    debugPrint(decodedData.toString());

                    if (response.statusCode == 200) {
                      // final prefs = await SharedPreferences.getInstance();

                      // prefs.setString('username', username);
                      // prefs.setString('password', pass);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Home(),
                      ));
                    }
                  },
                  child: Text(
                    txt,
                    style: const TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
