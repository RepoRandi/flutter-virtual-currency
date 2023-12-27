import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_currency/core.dart';

Widget topNavigationBar() {
  return Container(
    padding: const EdgeInsets.all(25),
    decoration: const BoxDecoration(color: Colors.white),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Image.asset(
              "assets/icons/icon_home.png",
              fit: BoxFit.fill,
            ),
            Text(
              'HOME',
              style: GoogleFonts.roboto(
                color: blueColor,
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset(
              "assets/icons/icon_transaction_disable.png",
              fit: BoxFit.fill,
            ),
            Text(
              'TRANSAKSI',
              style: GoogleFonts.roboto(
                color: blueColor.withOpacity(0.2),
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset(
              "assets/icons/icon_report_disable.png",
              fit: BoxFit.fill,
            ),
            Text(
              'LAPORAN',
              style: GoogleFonts.roboto(
                color: blueColor.withOpacity(0.2),
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset(
              "assets/icons/icon_tools_disable.png",
              fit: BoxFit.fill,
            ),
            Text(
              'TOOLS',
              style: GoogleFonts.roboto(
                color: blueColor.withOpacity(0.2),
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )
      ],
    ),
  );
}
