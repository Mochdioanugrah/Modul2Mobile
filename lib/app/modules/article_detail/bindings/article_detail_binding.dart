import 'package:get/get.dart';

import 'package:tugas1mobile/app/modules/article_detail/controllers/article_detail_controller.dart.dart';

class ArticleDetailBinding extends  Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailController());
  }
  
}