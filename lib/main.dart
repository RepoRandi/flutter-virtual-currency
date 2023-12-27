import 'package:virtual_currency/core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Currency',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: SessionService().isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            final bool isLoggedIn = snapshot.data ?? false;

            return isLoggedIn ? const HomeView() : const LoginView();
          }
        },
      ),
    );
  }
}
