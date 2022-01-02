import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenWebForAuth extends StatefulWidget {
  final clientId;
  final callBackUrl;

  const OpenWebForAuth({Key key, this.clientId, this.callBackUrl})
      : super(key: key);

  @override
  _OpenWebForAuthState createState() => _OpenWebForAuthState();
}

class _OpenWebForAuthState extends State<OpenWebForAuth> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Login'),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl:
              'https://github.com/login/oauth/authorize?client_id=${widget.clientId}&scope=repo%20workflow%20write:packages%20delete:packages%20admin:org%20admin:public_key%20admin:repo_hook%20admin:org_hook%20gist%20notifications%20user%20delete_repo%20write:discussion%20admin:enterprise%20codespace%20admin:gpg_key',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onPageStarted: (String url) {
            if (url.startsWith(widget.callBackUrl)) {
              Navigator.pop(
                context,
                url.toString().substring(url.lastIndexOf("=") + 1),
              );
            }
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }
}
