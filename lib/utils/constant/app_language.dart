import 'package:get/get.dart';
import 'package:sheba_plus/view/languages/bn.dart';
import 'package:sheba_plus/view/languages/en.dart';

class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'bn_BD': bn,
  };
}
