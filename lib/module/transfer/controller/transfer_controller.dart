import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtual_currency/core.dart';

class TransferController extends State<TransferView> {
  static late TransferController instance;
  late TransferView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    inputController.dispose();
    informationController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String optionFromOutlet = 'Nama Outlet';
  String selectedFromOutlet = '';

  void updateSelectedFromOutlet(String value) {
    setState(() {
      if (value == 'Outlet 1') {
        selectedFromOutlet = '1';
      } else if (value == 'Outlet 2') {
        selectedFromOutlet = '2';
      } else if (value == 'Outlet 3') {
        selectedFromOutlet = '5';
      } else if (value == 'Outlet 4') {
        selectedFromOutlet = '7';
      } else if (value == 'Outlet 5') {
        selectedFromOutlet = '8';
      } else if (value == 'Outlet 6') {
        selectedFromOutlet = '9';
      } else {
        selectedFromOutlet = '10';
      }

      optionFromOutlet = value;
    });
  }

  bool isMenuFromOutletOpen = false;

  void toggleMenuFromOutlet() {
    setState(() {
      isMenuFromOutletOpen = !isMenuFromOutletOpen;
    });
  }

  String optionToOutlet = 'Nama Outlet';
  String selectedToOutlet = '';

  void updateSelectedToOutlet(String value) {
    setState(() {
      if (value == 'Outlet 1') {
        selectedToOutlet = '1';
      } else if (value == 'Outlet 2') {
        selectedToOutlet = '2';
      } else if (value == 'Outlet 3') {
        selectedToOutlet = '5';
      } else if (value == 'Outlet 4') {
        selectedToOutlet = '7';
      } else if (value == 'Outlet 5') {
        selectedToOutlet = '8';
      } else if (value == 'Outlet 6') {
        selectedToOutlet = '9';
      } else {
        selectedToOutlet = '10';
      }

      optionToOutlet = value;
    });
  }

  bool isMenuToOutletOpen = false;

  void toggleMenuToOutlet() {
    setState(() {
      isMenuToOutletOpen = !isMenuToOutletOpen;
    });
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  TextEditingController inputController = TextEditingController();

  List<String> iconCurrencyPath = [
    'assets/icons/icon_idr.png',
    'assets/icons/icon_usd.png',
    'assets/icons/icon_eur.png',
    'assets/icons/icon_sgd.png',
  ];

  String selectedIconCurrencyPath = 'assets/icons/icon_idr.png';

  String optionCurrency = 'IDR';
  String selectedCurrency = '';

  void updateSelectedCurrency(String value) {
    setState(() {
      if (value == 'IDR') {
        selectedIconCurrencyPath = iconCurrencyPath[0];
        selectedCurrency = '1';
      } else if (value == 'USD') {
        selectedIconCurrencyPath = iconCurrencyPath[1];
        selectedCurrency = '2';
      } else if (value == 'SGD') {
        selectedIconCurrencyPath = iconCurrencyPath[2];
        selectedCurrency = '3';
      } else {
        selectedIconCurrencyPath = iconCurrencyPath[3];
        selectedCurrency = '4';
      }

      optionCurrency = value;
    });
  }

  bool isMenuCurrencyOpen = false;

  void toggleMenuCurrency() {
    setState(() {
      isMenuCurrencyOpen = !isMenuCurrencyOpen;
    });
  }

  List<String?> selectedImages = List.filled(5, null);

  Future<void> pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImages[index] = pickedFile.path;
      }
    });
  }

  TextEditingController informationController = TextEditingController();

  final SessionService sessionService = SessionService();

  bool isLoading = false;

  Future<void> trxTransfer() async {
    if (inputController.text.isEmpty) {
      Snackbar.showInfo(Get.currentContext, 'Input nominal tidak boleh kosong');

      return;
    }

    try {
      String? storedCookie = await sessionService.getSession('cookie');

      if (storedCookie != null) {
        Map<String, dynamic> requestData = {
          "act": "trxAdd",
          "outlet_id": 0,
          "user_id": 1,
          "data": {
            "ptipe": 3,
            "curr_id": int.tryParse(selectedCurrency) ?? 1,
            "nominal": inputController.text,
            "ket": informationController.text,
            "photo": "",
            "outlet_id1": int.tryParse(selectedFromOutlet) ?? 1,
            "outlet_id2": int.tryParse(selectedToOutlet) ?? 2,
            "tgl": "$selectedDate"
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
              'Transaksi dengan nominal $optionCurrency ${inputController.text} sukses');

          Get.back();
        } else {
          Snackbar.showError(Get.currentContext,
              'Transaksi dengan nominal $selectedCurrency ${inputController.text} gagal');
        }
      }
    } catch (e) {
      Snackbar.showError(Get.currentContext, e.toString());
    }
  }
}
