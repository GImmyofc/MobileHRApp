import 'package:flutter/material.dart';
import 'package:backendless_sdk/backendless_sdk.dart';

import 'package:hrapp/view/Signin.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Backendless
  await Backendless.initApp(
    applicationId: 'YOUR_APP_ID',
    androidApiKey: 'YOUR_API_KEY',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(), // Your sign-in screen
    );
  }
}
