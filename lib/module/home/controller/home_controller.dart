import 'dart:async';
import 'dart:convert';
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:virtual_currency/core.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    fetchData();
    fetchBackground();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final Logger _logger = Logger();
  final SessionService sessionService = SessionService();

  String optionOutlet = 'Nama Outlet';
  String selectedOutlet = '';

  void updateSelectedOutlet(String value) {
    setState(() {
      if (value == 'Outlet 1') {
        selectedOutlet = '1';
      } else if (value == 'Outlet 2') {
        selectedOutlet = '2';
      } else if (value == 'Outlet 3') {
        selectedOutlet = '5';
      } else if (value == 'Outlet 4') {
        selectedOutlet = '7';
      } else if (value == 'Outlet 5') {
        selectedOutlet = '8';
      } else if (value == 'Outlet 6') {
        selectedOutlet = '9';
      } else {
        selectedOutlet = '10';
      }

      optionOutlet = value;
    });
  }

  bool isMenuOutletOpen = false;

  void toggleMenuOutlet() {
    setState(() {
      isMenuOutletOpen = !isMenuOutletOpen;
    });
  }

  int totalQuantity = 0;
  double balance = 0;
  double nominalIDR = 0;
  double nominalUSD = 0;
  double nominalEUR = 0;
  double nominalSGD = 0;
  double totalIDR = 0;
  double totalUSD = 0;
  double totalEUR = 0;
  double totalSGD = 0;

  Future<void> fetchData() async {
    try {
      String? storedCookie = await sessionService.getSession('cookie');

      if (storedCookie != null) {
        Map<String, dynamic> requestData = {
          "act": "trxGet",
          "outlet_id": int.tryParse(selectedOutlet) ?? 1,
          "user_id": 1,
          "data": {"trx_id": 0, "status": 1, "date_start": "", "date_end": ""}
        };

        final response =
            await ApiClient.get('API/Trx/Get', storedCookie, requestData);

        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = jsonDecode(response.body);

          String latestTimestamp = '';

          double totalIn = 0;
          double totalOut = 0;
          double totalInIDR = 0;
          double totalOutIDR = 0;
          double totalInUSD = 0;
          double totalOutUSD = 0;
          double totalInEUR = 0;
          double totalOutEUR = 0;
          double totalInSGD = 0;
          double totalOutSGD = 0;
          int totalTransactions = 0;

          for (var transaction in responseData['data']) {
            String? trxPtipeName = transaction['trx_ptipe_nama'];
            double trxNominal = double.parse(transaction['trx_nominal']);
            String currentTimestamp = transaction['trx_date_created'];
            String trxCurtipeVar = transaction['trx_curtipe_var'];

            if (currentTimestamp.compareTo(latestTimestamp) > 0) {
              latestTimestamp = currentTimestamp;

              if (trxCurtipeVar == 'Rp') {
                nominalIDR = trxNominal;
              } else if (trxCurtipeVar == '\$') {
                nominalUSD = trxNominal;
              } else if (trxCurtipeVar == '€') {
                nominalEUR = trxNominal;
              } else {
                nominalSGD = trxNominal;
              }
            }

            if (trxPtipeName != null) {
              if (trxPtipeName == 'Masuk') {
                totalIn += trxNominal;

                if (trxCurtipeVar == 'Rp') {
                  totalInIDR += trxNominal;
                } else if (trxCurtipeVar == '\$') {
                  totalInUSD += trxNominal;
                } else if (trxCurtipeVar == '€') {
                  totalInEUR += trxNominal;
                } else {
                  totalInSGD += trxNominal;
                }
              } else if (trxPtipeName == 'Keluar') {
                totalOut += trxNominal;

                if (trxCurtipeVar == 'Rp') {
                  totalOutIDR += trxNominal;
                } else if (trxCurtipeVar == '\$') {
                  totalOutUSD += trxNominal;
                } else if (trxCurtipeVar == '€') {
                  totalOutEUR += trxNominal;
                } else {
                  totalOutSGD += trxNominal;
                }
              }
            }

            totalTransactions++;
          }

          totalQuantity = totalTransactions;
          balance = totalIn - totalOut;
          totalIDR = totalInIDR - totalOutIDR;
          totalUSD = totalInUSD - totalOutUSD;
          totalEUR = totalInEUR - totalOutEUR;
          totalSGD = totalInSGD - totalOutSGD;
        } else {
          _logger.e('Failed to fetch data with status: ${response.statusCode}');
        }
      } else {
        _logger.e('Cookie not found');
      }
    } catch (e) {
      _logger.e(e.toString());
    }
  }

  void refresh() {
    if (mounted) {
      setState(() {
        fetchData();
      });
    }
  }

  final AuthenticationService authService = AuthenticationService();

  Future<void> handleBackgroundHit() async {
    try {
      final response = await authService.backgroundHit();

      _logger.d(response);
    } catch (e) {
      _logger.e(e.toString());
    }
  }

  Future<void> fetchBackground() async {
    int status = await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 30,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.NONE,
      ),
      (String taskId) async {
        await handleBackgroundHit();

        BackgroundFetch.finish(taskId);
      },
      (String taskId) async {
        BackgroundFetch.finish(taskId);
      },
    );

    _logger.d(status);

    if (!mounted) return;
  }
}
