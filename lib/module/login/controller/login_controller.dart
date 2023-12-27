import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtual_currency/core.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    updateGreetingAndBackground();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String greeting = '';
  String backgroundImagePath = '';

  void updateGreetingAndBackground() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.H().format(now);

    if (formattedTime.contains("05") ||
        formattedTime.contains("06") ||
        formattedTime.contains("07") ||
        formattedTime.contains("08") ||
        formattedTime.contains("09") ||
        formattedTime.contains("10") ||
        formattedTime.contains("11")) {
      greeting = 'Selamat Pagi';
      backgroundImagePath = 'assets/images/morning.jpg';
    } else if (formattedTime.contains("12") ||
        formattedTime.contains("13") ||
        formattedTime.contains("14") ||
        formattedTime.contains("15")) {
      greeting = 'Selamat Siang';
      backgroundImagePath = 'assets/images/afternoon.jpeg';
    } else if (formattedTime.contains("16") ||
        formattedTime.contains("17") ||
        formattedTime.contains("18")) {
      greeting = 'Selamat Sore';
      backgroundImagePath = 'assets/images/evening.jpg';
    } else {
      greeting = 'Selamat Malam';
      backgroundImagePath = 'assets/images/night.jpg';
    }
  }

  final AuthenticationService authService = AuthenticationService();
  final SessionService sessionService = SessionService();

  bool isLoading = false;

  Future<void> handleLogin() async {
    try {
      setState(() {
        isLoading = true;
      });

      String? cookie = await authService.login();
      await sessionService.saveSession('cookie', cookie!);

      setState(() {
        isLoading = false;
      });

      Snackbar.showSuccess(Get.currentContext,
          'Selamat datang, team rekrutmen PT Jagat Teknologi Indonesia.');

      Get.offAll(const HomeView());
    } catch (e) {
      Snackbar.showError(Get.currentContext, e.toString());
    }
  }
}
