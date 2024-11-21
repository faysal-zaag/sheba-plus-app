import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/loader_controller.dart';
import 'package:sheba_plus/utils/utils.dart';

class NetworkController extends GetxController {
  final hasConnection = false.obs;
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    // TODO: implement onInit
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    super.onInit();
  }

  Future<void> getConnectionType() async {
    late List<ConnectivityResult> connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (err) {
      Utils.showErrorToast(message: err.message ?? "");
    }
    return _updateState(connectivityResult);
  }

  _updateState(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi)) {
      hasConnection(true);
      hideLoading();
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      hasConnection(false);
      showNoInternetDialog(checkInternet: getConnectionType);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _streamSubscription.cancel();
    super.onClose();
  }
}
