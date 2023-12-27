import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtual_currency/core.dart';

class IncomeView extends StatefulWidget {
  const IncomeView({Key? key}) : super(key: key);

  Widget build(context, IncomeController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Masuk',
          style: TextStyle(
            color: blueColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(152, 160, 152, 0),
                      items: <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'Outlet 1',
                          child: Text(
                            'Outlet 1',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: blueColor),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Outlet 2',
                          child: Text(
                            'Outlet 2',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: blueColor),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Outlet 3',
                          child: Text(
                            'Outlet 3',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: blueColor),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Outlet 4',
                          child: Text(
                            'Outlet 4',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: blueColor),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Outlet 5',
                          child: Text(
                            'Outlet 5',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: blueColor),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Outlet 6',
                          child: Text(
                            'Outlet 6',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: blueColor),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Outlet 7',
                          child: Text(
                            'Outlet 7',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: blueColor),
                          ),
                        ),
                      ],
                    ).then((value) {
                      if (value != null) {
                        controller.updateSelectedOutlet(value);
                      }
                    });
                    controller.toggleMenuOutlet();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.optionOutlet,
                        style: GoogleFonts.roboto(
                          color: blueColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        controller.isMenuOutletOpen
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: blueColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 33.0),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                decoration: const BoxDecoration(
                  color: blueColor,
                ),
                child: Column(
                  children: [
                    Text(
                      'Start Date',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    InkWell(
                      onTap: () => controller.selectDate(context),
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 8,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Text(
                          DateFormat('dd/MM/yyyy')
                              .format(controller.selectedDate),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: blueColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 13.0),
                    Text(
                      'Input',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.only(bottom: 7),
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: TextField(
                              controller: controller.inputController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(8),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                showMenu(
                                  context: context,
                                  position: const RelativeRect.fromLTRB(
                                      30, 315, 20, 0),
                                  items: <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      value: 'IDR',
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/icons/icon_idr.png",
                                            width: 20.0,
                                            height: 10.0,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            'IDR',
                                            style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: blueColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'USD',
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/icons/icon_usd.png",
                                            width: 20.0,
                                            height: 10.0,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            'USD',
                                            style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: blueColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'EUR',
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/icons/icon_eur.png",
                                            width: 20.0,
                                            height: 10.0,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            'EUR',
                                            style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: blueColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'SGD',
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/icons/icon_sgd.png",
                                            width: 20.0,
                                            height: 10.0,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            'SGD',
                                            style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: blueColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ).then((value) {
                                  if (value != null) {
                                    controller.updateSelectedCurrency(value);
                                  }
                                });
                                controller.toggleMenuCurrency();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    controller.selectedIconCurrencyPath,
                                    width: 20.0,
                                    height: 10.0,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(
                                    controller.optionCurrency,
                                    style: GoogleFonts.roboto(
                                      color: blueColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Icon(
                                    controller.isMenuCurrencyOpen
                                        ? Icons.arrow_drop_down
                                        : Icons.arrow_drop_up,
                                    color: blueColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13.0),
                    Text(
                      'Photo',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      height: 61,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 33.0, vertical: 9.0),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Container(
                          width: 55,
                          margin: const EdgeInsets.only(right: 12.0),
                          padding: const EdgeInsets.all(4.0),
                          decoration: ShapeDecoration(
                            color: controller.selectedImages[index] != null
                                ? blueColor
                                : lightBlueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: InkWell(
                            onTap: () => controller.pickImage(index),
                            child: controller.selectedImages[index] != null
                                ? Image.asset(
                                    controller.selectedImages[index]!,
                                    fit: BoxFit.cover,
                                  )
                                : Column(
                                    children: [
                                      Image.asset(
                                        "assets/icons/icon_camera.png",
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        'Tambahkan\nFoto',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                          color: blueColor,
                                          fontSize: 5,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 13.0),
                    Text(
                      'Keterangan',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.only(bottom: 7),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: TextField(
                        controller: controller.informationController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 288.0),
                    SizedBox(
                      width: 111,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: lightBlueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () => controller.trxIncome(),
                        child: controller.isLoading
                            ? const CircularProgressIndicator(
                                color: vibrantBlueColor,
                              )
                            : Text(
                                'Submit',
                                style: GoogleFonts.roboto(
                                  color: blueColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<IncomeView> createState() => IncomeController();
}
