import 'package:get/get.dart';
import 'package:sheba_plus/utils/routes/routes.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 1.obs;
//
// late List<Widget> widgetOptions;
//
// NavigationController() {
//   widgetOptions = <Widget>[
//     HomeScreen(),
//     ProfileScreen(),
//   ];
// }
//
// void changeTabIndex(int index) {
//   selectedIndex.value = index;
// }

  onChangeNavigationTap(int index) {
    if(index == 0){
      Get.offAllNamed(Routes.home);
    }
  }
}
