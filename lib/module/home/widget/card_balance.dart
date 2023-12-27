import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:virtual_currency/core.dart';

Widget cardBalance(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
        color: lightBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const IncomeView()).then((value) {
                      controller.refresh();
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/icon_in.png",
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'MASUK',
                        style: GoogleFonts.roboto(
                          color: blueColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ExpenseView()).then((value) {
                      controller.refresh();
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/icon_out.png",
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'KELUAR',
                        style: GoogleFonts.roboto(
                          color: blueColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const TransferView()).then((value) {
                      controller.refresh();
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/icon_transfer.png",
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'PINDAH',
                        style: GoogleFonts.roboto(
                          color: blueColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const MutationView()).then((value) {
                      controller.refresh();
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/icon_mutation.png",
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'MUTASI',
                        style: GoogleFonts.roboto(
                          color: blueColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(const ExchangeRateScreenView()).then((value) {
                      controller.refresh();
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/icon_exchange_rate.png",
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'KURS',
                        style: GoogleFonts.roboto(
                          color: blueColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<void>(
              future: controller.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: 100,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: vibrantBlueColor,
                    )),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  String formatWithPeriod(double number, String locale) {
                    final String formatted =
                        NumberFormat('###,###', locale).format(number);
                    return formatted.replaceAll(',', '.');
                  }

                  String formattedBalanceIDR =
                      formatWithPeriod(controller.totalIDR.toDouble(), 'id_ID');

                  String formattedBalanceInUSD =
                      formatWithPeriod(controller.totalUSD.toDouble(), 'en_US');

                  String formattedBalanceInEUR =
                      formatWithPeriod(controller.totalEUR.toDouble(), 'de_DE');

                  String formattedBalanceInSGD =
                      formatWithPeriod(controller.totalSGD.toDouble(), 'en_SG');

                  return Container(
                    padding: const EdgeInsets.all(15),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Jumlah Barang',
                                    style: GoogleFonts.roboto(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        color: greyColor),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Flexible(
                                    child: Text(
                                      '---------------------------------------------------------------------',
                                      style: GoogleFonts.roboto(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700,
                                          color: blueColor.withOpacity(0.2)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '${controller.totalQuantity}',
                              style: GoogleFonts.roboto(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: greyColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Total IDR',
                                    style: GoogleFonts.roboto(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: blueColor),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Flexible(
                                    child: Text(
                                      '-----------------------------------------------------------',
                                      style: GoogleFonts.roboto(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700,
                                          color: blueColor.withOpacity(0.2)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              'Rp $formattedBalanceIDR',
                              style: GoogleFonts.roboto(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: blueColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Total USD',
                                    style: GoogleFonts.roboto(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: blueColor),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Flexible(
                                    child: Text(
                                      '--------------------------------------------------------------------',
                                      style: GoogleFonts.roboto(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700,
                                          color: blueColor.withOpacity(0.2)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '\$ $formattedBalanceInUSD',
                              style: GoogleFonts.roboto(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: blueColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Total EUR',
                                    style: GoogleFonts.roboto(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: blueColor),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Flexible(
                                    child: Text(
                                      '----------------------------------------------------------------------',
                                      style: GoogleFonts.roboto(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700,
                                          color: blueColor.withOpacity(0.2)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '€ $formattedBalanceInEUR',
                              style: GoogleFonts.roboto(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    'Total SGD',
                                    style: GoogleFonts.roboto(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: blueColor),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Flexible(
                                    child: Text(
                                      '-------------------------------------------------------------------',
                                      style: GoogleFonts.roboto(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700,
                                          color: blueColor.withOpacity(0.2)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              'S\$ $formattedBalanceInSGD',
                              style: GoogleFonts.roboto(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: blueColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}
