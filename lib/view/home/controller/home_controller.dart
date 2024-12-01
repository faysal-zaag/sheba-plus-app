import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/service/service.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view_model/repositories/home.repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  final carouselCurrentIndex = 0.obs;
  final selectedService = 0.obs;
  final selectedLanguage = "English".obs;
  final servicesLoading = false.obs;
  final services = <Service>[].obs;

  void onCarouselChange(int index) {
    carouselCurrentIndex(index);
  }

  void onSelectService(int index) {
    if (selectedService.value == index) {
      selectedService(0);
    } else {
      selectedService(index);
    }
  }

  Future<void> getServices() async {
    try {
      servicesLoading(true);

      final response = await _homeRepository.getServices();

      var serviceListData = response.data as List;

      var serviceList = serviceListData.map((service) {
        return Service.fromJson(service);
      }).toList();

      services(serviceList);
    } catch (err) {
      Log.error(err.toString());
    } finally {
      servicesLoading(false);
    }
  }
}
