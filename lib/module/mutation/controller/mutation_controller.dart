import 'package:flutter/material.dart';
import 'package:virtual_currency/core.dart';

class MutationController extends State<MutationView> {
  static late MutationController instance;
  late MutationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    inputFromController.dispose();
    inputToController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

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

  DateTime selectedDateStart = DateTime.now();
  DateTime selectedDateEnd = DateTime.now();
  bool isDateOpen = false;

  Future<void> selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    );

    if (picked != null) {
      setState(() {
        selectedDateStart = picked.start;
        selectedDateEnd = picked.end;
      });
    }
  }

  void toggleDate(BuildContext context) {
    setState(() {
      isDateOpen = !isDateOpen;
      if (isDateOpen) {
        selectDateRange(context);
      }
    });
  }

  List<String> iconCurrencyPath = [
    'assets/icons/icon_idr.png',
    'assets/icons/icon_usd.png',
    'assets/icons/icon_eur.png',
    'assets/icons/icon_sgd.png',
  ];

  TextEditingController inputFromController = TextEditingController();

  String selectedIconCurrencyPathFrom = 'assets/icons/icon_idr.png';
  String optionCurrencyFrom = 'IDR';
  String selectedCurrencyFrom = '';

  void updateSelectedCurrencyFrom(String value) {
    setState(() {
      if (value == 'IDR') {
        selectedIconCurrencyPathFrom = iconCurrencyPath[0];
        selectedCurrencyFrom = '1';
      } else if (value == 'USD') {
        selectedIconCurrencyPathFrom = iconCurrencyPath[1];
        selectedCurrencyFrom = '2';
      } else if (value == 'SGD') {
        selectedIconCurrencyPathFrom = iconCurrencyPath[2];
        selectedCurrencyFrom = '3';
      } else {
        selectedIconCurrencyPathFrom = iconCurrencyPath[3];
        selectedCurrencyFrom = '4';
      }

      optionCurrencyFrom = value;
    });
  }

  bool isMenuCurrencyOpenFrom = false;

  void toggleMenuCurrencyFrom() {
    setState(() {
      isMenuCurrencyOpenFrom = !isMenuCurrencyOpenFrom;
    });
  }

  TextEditingController inputToController = TextEditingController();

  String selectedIconCurrencyPathTo = 'assets/icons/icon_idr.png';
  String optionCurrencyTo = 'IDR';
  String selectedCurrencyTo = '';

  void updateSelectedCurrencyTo(String value) {
    setState(() {
      if (value == 'IDR') {
        selectedIconCurrencyPathTo = iconCurrencyPath[0];
        selectedCurrencyTo = '1';
      } else if (value == 'USD') {
        selectedIconCurrencyPathTo = iconCurrencyPath[1];
        selectedCurrencyTo = '2';
      } else if (value == 'SGD') {
        selectedIconCurrencyPathTo = iconCurrencyPath[2];
        selectedCurrencyTo = '3';
      } else {
        selectedIconCurrencyPathTo = iconCurrencyPath[3];
        selectedCurrencyTo = '4';
      }

      optionCurrencyTo = value;
    });
  }

  bool isMenuCurrencyOpenTo = false;

  void toggleMenuCurrencyTo() {
    setState(() {
      isMenuCurrencyOpenTo = !isMenuCurrencyOpenTo;
    });
  }

  final SessionService sessionService = SessionService();

  bool isLoading = false;

  Future<void> trxMutation() async {
    if (inputFromController.text.isEmpty && inputToController.text.isEmpty) {
      Snackbar.showInfo(Get.currentContext, 'Input nominal tidak boleh kosong');

      return;
    }

    try {
      String? storedCookie = await sessionService.getSession('cookie');

      if (storedCookie != null) {
        Map<String, dynamic> requestData = {
          "act": "trxAdd",
          "outlet_id": int.tryParse(selectedOutlet) ?? 1,
          "user_id": 1,
          "data": {
            "ptipe": 4,
            "curr_id": int.tryParse(selectedCurrencyFrom) ?? 1,
            "curr_id2": int.tryParse(selectedCurrencyTo) ?? 1,
            "nominal": inputFromController.text,
            "nominal2": inputToController.text,
            "ket": '',
            "photo": "",
            "outlet_id1": 0,
            "outlet_id2": 0,
            "tgl": "$selectedDateStart",
            "tgl2": "$selectedDateEnd"
          }
        };

        setState(() {
          isLoading = true;
        });

        final response =
            await ApiClient.post('API/Trx/Add', storedCookie, requestData);

        setState(() {
          isLoading = false;
        });

        if (response.statusCode == 200) {
          Snackbar.showSuccess(Get.currentContext,
              'Transaksi dengan nominal $optionCurrencyFrom ${inputFromController.text} - $optionCurrencyTo ${inputToController.text} sukses');

          Get.back();
        } else {
          Snackbar.showError(Get.currentContext,
              'Transaksi dengan nominal $selectedCurrencyFrom $optionCurrencyFrom ${inputFromController.text} - $optionCurrencyTo ${inputToController.text} gagal');
        }
      }
    } catch (e) {
      Snackbar.showError(Get.currentContext, e.toString());
    }
  }
}
