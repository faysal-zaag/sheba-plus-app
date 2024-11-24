import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  final carouselCurrentIndex = 0.obs;
  final selectedService = 0.obs;

  void onCarouselChange(int index){
    carouselCurrentIndex(index);
  }

  void onSelectService(int index){
    if(selectedService.value == index) {
      selectedService(0);
    } else {
      selectedService(index);
    }
  }
}