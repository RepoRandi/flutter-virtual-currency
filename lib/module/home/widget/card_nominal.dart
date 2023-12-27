import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:virtual_currency/core.dart';

Widget cardNominal(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: FutureBuilder<void>(
      future: controller.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 148,
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

          String formattedNominalIDR =
              formatWithPeriod(controller.nominalIDR.toDouble(), 'id_ID');

          String formattedNominalInUSD =
              formatWithPeriod(controller.nominalUSD.toDouble(), 'en_US');

          String formattedNominalInEUR =
              formatWithPeriod(controller.nominalEUR.toDouble(), 'de_DE');

          String formattedNominalInSGD =
              formatWithPeriod(controller.nominalSGD.toDouble(), 'en_SG');

          return Slidable(
            key: const ValueKey(0),
            startActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: null,
                  backgroundColor: lightBlueColor,
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: const [
                SlidableAction(
                  onPressed: null,
                  backgroundColor: redColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Container(
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
                  InkWell(
                    onTap: () {
                      showMenu(
                        context: context,
                        position: const RelativeRect.fromLTRB(20, 280, 20, 0),
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
                    child: Text(
                      controller.optionOutlet,
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: blueColor),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/icon_idr.png",
                              width: 22.0,
                              height: 15.0,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'IDR',
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: greyColor),
                            ),
                            const SizedBox(width: 5.0),
                            Flexible(
                              child: Text(
                                '----------------------------------------------------------------',
                                style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: blueColor.withOpacity(0.2)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        formattedNominalIDR,
                        style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: blueColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/icon_usd.png",
                              width: 22.0,
                              height: 15.0,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'USD',
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: greyColor),
                            ),
                            const SizedBox(width: 5.0),
                            Flexible(
                              child: Text(
                                '----------------------------------------------------------------',
                                style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: blueColor.withOpacity(0.2)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        formattedNominalInUSD,
                        style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: blueColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/icon_eur.png",
                              width: 22.0,
                              height: 15.0,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'EUR',
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: greyColor),
                            ),
                            const SizedBox(width: 5.0),
                            Flexible(
                              child: Text(
                                '----------------------------------------------------------------',
                                style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: blueColor.withOpacity(0.2)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        formattedNominalInEUR,
                        style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: blueColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/icon_sgd.png",
                              width: 22.0,
                              height: 15.0,
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'SGD',
                              style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: greyColor),
                            ),
                            const SizedBox(width: 5.0),
                            Flexible(
                              child: Text(
                                '----------------------------------------------------------------',
                                style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: blueColor.withOpacity(0.2)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        formattedNominalInSGD,
                        style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: blueColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    ),
  );
}
