import 'package:sheba_plus/utils/helpers/dialog_helper.dart';

showLoading({String message = "Please Wait..."}) {
  DialogHelper.showLoading(message: message);
}

hideLoading({int? id}) {
  DialogHelper.hideLoading(id: id);
}

showNoInternetDialog({required Function checkInternet}) {
  DialogHelper.showNoInternetDialog(checkInternet: checkInternet);
}
