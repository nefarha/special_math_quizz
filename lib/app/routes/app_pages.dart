import 'package:get/get.dart';

import '../modules/QuizList/bindings/quiz_list_binding.dart';
import '../modules/QuizList/views/quiz_list_view.dart';
import '../modules/SoalDetail/bindings/soal_detail_binding.dart';
import '../modules/SoalDetail/views/soal_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ_LIST,
      page: () => const QuizListView(),
      binding: QuizListBinding(),
    ),
    GetPage(
      name: _Paths.SOAL_DETAIL,
      page: () => const SoalDetailView(),
      binding: SoalDetailBinding(),
    ),
  ];
}
