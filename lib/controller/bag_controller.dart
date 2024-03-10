import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/image.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';

class BagController extends GetxController {
  final RxBool showFirstContent = true.obs;
  RxBool searchBoolean = false.obs;

  void toggleContent() {
    showFirstContent.toggle();
  }

  RxList<int> itemQuantities = List.generate(2, (index) => 1).obs;
  final List<RxBool> isFavouriteArrivalList = List.generate(4, (_) => true.obs);

  void incrementCounter(int index) {
    itemQuantities[index]++;
  }

  void decrementCounter(int index) {
    if (itemQuantities[index] > 1) {
      itemQuantities[index]--;
    }
  }

  void toggleArrivalFavorite(int imageArrivalIndex) {
    isFavouriteArrivalList[imageArrivalIndex].value = !isFavouriteArrivalList[imageArrivalIndex].value;
  }

  List<String> bagProducts = [
    ImageConfig.trendingP2,
    ImageConfig.electronics,
  ];

  List<String> bagProductsTitle = [
    TextString.mintJeansShirt,
    TextString.silentHeadphone,
  ];

  List<String> bagProductsSubtitle = [
    TextString.mintShiner,
    TextString.stylishAndLatest,
  ];

  List<String> bagProductsPrice = [
    TextString.dollar260,
    TextString.dollar460,
  ];
}
