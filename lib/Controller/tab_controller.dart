import 'package:get/get.dart';
import 'package:movie_app/Screen/account_page.dart';
import 'package:movie_app/Screen/homepage.dart';
import 'package:movie_app/Screen/tvshow_page.dart';

class BottomNavController extends GetxController {
  RxInt isTab = 0.obs;
  final List page = [const Homepage(), const TvShowPage(), const AccountPage()];
}
