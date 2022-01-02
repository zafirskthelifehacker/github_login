import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'openWebForAuth.dart';

class GithubLogin {
  getToken({context, clientId, clientSecret, callBackUrl}) async {
    final code = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OpenWebForAuth(
            clientId: clientId,
            callBackUrl: callBackUrl,
          ),
        ));
    if (code != null) {
      return callTokenApi(code, clientId, clientSecret);
    }
  }

  callTokenApi(code, clientId, clientSecret) async {
    var dio = Dio();
    var params = {
      "client_id": clientId,
      "client_secret": clientSecret,
      "code": code.toString()
    };
    var result = await dio.post('https://github.com/login/oauth/access_token',
        data: params);
    return result.toString().substring(
        result.toString().indexOf("=") + 1, result.toString().indexOf("&"));
  }
}
