import 'package:get/get.dart';

import '../controllers/quiz_list_controller.dart';

class QuizListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizListController>(
      () => QuizListController(),
    );
  }
}
