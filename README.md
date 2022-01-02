# github_login

Flutter Plugin for Github

## Getting Started
Import the plugin
```dart
import 'package:github_login/github_login.dart';
```
Now, just create object and call method
```dart
 GithubLogin user = new GithubLogin();
  await user.getToken(context: context,
                        clientId: "YourOAuthAppClientId",
                        clientSecret: "YourOAuthAppSecret",
                        callBackUrl:"https://example.com");                
```
## Example

```dart
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  String token = await user.getToken(context: context,
                      clientId: "YourOAuthAppClientId",
                      clientSecret: "YourOAuthAppSecret",
                      callBackUrl:"https://example.com");
                  print("TOKEN FROM PLUGIN ::: $token");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
```

