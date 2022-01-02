import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:github_login/github_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Github Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () async {
                  GithubLogin user = new GithubLogin();
                  String token = await user.getToken(
                      context: context,
                      clientId: "ClientID",
                      clientSecret: "ClientSecret",
                      callBackUrl: "https://example.com");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
