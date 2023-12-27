import 'package:flutter/material.dart';
import 'package:virtual_currency/core.dart';

Widget buildRefreshIcon(HomeController controller) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25.0),
        bottomRight: Radius.circular(25.0),
      ),
    ),
    child: InkWell(
      onTap: () => controller.refresh(),
      child: Image.asset(
        "assets/icons/icon_refresh.png",
        width: 30.0,
        height: 30.0,
        fit: BoxFit.fill,
      ),
    ),
  );
}
