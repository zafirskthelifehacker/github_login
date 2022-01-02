import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_login/github_login.dart';

void main() {
  const MethodChannel channel = MethodChannel('github_login');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });


}
