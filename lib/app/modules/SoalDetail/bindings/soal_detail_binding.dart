import 'package:get/get.dart';

import '../controllers/soal_detail_controller.dart';

class SoalDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SoalDetailController>(
      () => SoalDetailController(),
    );
  }
}
