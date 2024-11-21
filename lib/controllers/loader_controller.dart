import 'package:sheba_plus/utils/helpers/dialog_helper.dart';

showLoading([String? message]) {
  DialogHelper.showLoading(message);
}

hideLoading({int? id}) {
  DialogHelper.hideLoading(id: id);
}

showNoInternetDialog({required Function checkInternet}) {
  DialogHelper.showNoInternetDialog(checkInternet: checkInternet);
}
