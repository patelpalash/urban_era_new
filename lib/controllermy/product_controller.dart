import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/model/product_model.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/services/product_service.dart';

class Productcontroller extends GetxController {
  RxList<Products> product = <Products>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  void fetchCategory() async {
    try {
      isLoading(true);
      var pro = await Productservices.fetchdata();
      if (pro != null) {
        product.value = pro;
      }
    } finally {
      isLoading(false);
    }
  }
}
