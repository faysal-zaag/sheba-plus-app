import 'package:get/get.dart';
import 'package:sheba_plus/view_model/repositories/banner_repository.dart';

import '../../../models/banner/banner.dart';
import '../../../utils/logger.dart';

/**
 * Created by mahabubshozib on 12/26/24.
 * Author: Md Mahabub Hossain Shozib
 */

class BannerController extends GetxController {
  final BannerRepository _bannerRepository;

  BannerController(this._bannerRepository);

  final loadingAllBanners = false.obs;
  final allBanners = false.obs;

  //data
  final banners = <Banner>[].obs;

  // ================ Public Api call ==============
  Future<void> getAllBanners({required String bannerType}) async {
    try {
      loadingAllBanners(true);

      final response =
          await _bannerRepository.getAllBanners(bannerType: bannerType);

      var list =
          (response.data as List).map((e) => Banner.fromJson(e)).toList();
      banners(list);
      // debugPrint("get all banners: ${response.data}", wrapWidth: 1024);
    } catch (err) {
      Log.error(err.toString());
    } finally {
      loadingAllBanners(false);
    }
  }
}
