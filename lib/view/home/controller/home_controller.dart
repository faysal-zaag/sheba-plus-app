import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/models/service/service.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view_model/repositories/home.repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository;
  final StorageService _storageService;

  HomeController(this._homeRepository, this._storageService);

  final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  final carouselCurrentIndex = 0.obs;
  final selectedService = 0.obs;
  final selectedLanguage = "English".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(_storageService.getLanguage() == "en"){
      selectedLanguage("English");
    }
    else{
      selectedLanguage("বাংলা");
    }
  }
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
}
