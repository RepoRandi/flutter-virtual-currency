import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_currency/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'APP KEUANGAN',
          style: GoogleFonts.roboto(
            color: blueColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/icons/icon_notification.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: blueColor),
        child: Column(
          children: [
            topNavigationBar(),
            buildRefreshIcon(controller),
            cardNominal(controller),
            cardBalance(controller)
          ],
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
