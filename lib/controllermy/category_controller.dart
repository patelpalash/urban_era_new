import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/model/category_model.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/services/category_service.dart';

class Categorycontroller extends GetxController {
  RxList<Category> category = <Category>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  void fetchCategory() async {
    try {
      isLoading(true);
      var cat = await Categoryservices.fetchdata();
      if (cat != null) {
        category.value = cat;
      }
    } finally {
      isLoading(false);
    }
  }
}
