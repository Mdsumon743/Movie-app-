import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxBool isFavorite = false.obs;
  addFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
