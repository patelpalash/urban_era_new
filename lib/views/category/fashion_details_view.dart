// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/button_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/fashion_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/home_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/wishlist_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/model/product_model.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';

class FashionDetailsView extends StatelessWidget {
  FashionDetailsView({Key? key, required Products product}) : super(key: key);

  FashionController fashionController = Get.put(FashionController());
  HomeController homeController = Get.put(HomeController());
  ButtonController buttonController = Get.put(ButtonController());
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  WishlistController wishlistController = Get.put(WishlistController());
  DarkModeController darkModeController = Get.put(DarkModeController());

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomView);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: darkModeController.isLightTheme.value
              ? ColorsConfig.backgroundColor
              : ColorsConfig.buttonColor,
          appBar: AppBar(
            backgroundColor: darkModeController.isLightTheme.value
                ? ColorsConfig.backgroundColor
                : ColorsConfig.buttonColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(
                left: SizeConfig.padding05,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image(
                      image: const AssetImage(ImageConfig.backArrow),
                      width: SizeConfig.width24,
                      height: SizeConfig.height24,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.primaryColor
                          : ColorsConfig.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: SizeConfig.padding24,
                  top: SizeConfig.padding15,
                  bottom: SizeConfig.padding15,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        goToTab(3);
                      },
                      child: Image(
                        image: const AssetImage(ImageConfig.favourite),
                        width: SizeConfig.width20,
                        height: SizeConfig.height20,
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.primaryColor
                            : ColorsConfig.secondaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: SizeConfig.width18,
                    ),
                    Obx(
                      () => Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              goToTab(4);
                            },
                            child: Image(
                              image: const AssetImage(ImageConfig.cart),
                              width: SizeConfig.width20,
                              height: SizeConfig.height20,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          if (buttonController.isCartVisible.value)
                            const Positioned(
                              right: 0,
                              top: 0,
                              child: SizedBox(
                                width: SizeConfig.width06,
                                height: SizeConfig.height06,
                                child: Image(
                                  image: AssetImage(
                                    ImageConfig.dotToCart,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Obx(
            () => Padding(
              padding: const EdgeInsets.only(
                top: SizeConfig.padding10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.height280,
                      child: PageView.builder(
                        controller: fashionController.pageFashionController,
                        onPageChanged: (value) {
                          fashionController.currentPage.value = value;
                        },
                        itemCount: SizeConfig.fashionList5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding24,
                              right: SizeConfig.padding24,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: SizeConfig.height280,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  top: SizeConfig.padding08,
                                ),
                                child: Image(
                                  image: AssetImage(
                                    ImageConfig.trendingP2,
                                  ),
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        SizeConfig.fashionList5,
                        (int index) => buildDot(index: index),
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                TextString.mintJeansShirts,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: FontSize.heading4,
                                  fontFamily: FontFamily.lexendMedium,
                                  fontWeight: FontWeight.w500,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Share.share(TextString.appName);
                                    },
                                    child: Image(
                                      image:
                                          const AssetImage(ImageConfig.share),
                                      width: SizeConfig.width20,
                                      height: SizeConfig.height20,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width12,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      fashionController.toggleFashionFavorite();
                                    },
                                    child: Obx(() => Image(
                                          image: AssetImage(
                                            fashionController
                                                    .isFashionFavouriteList
                                                    .value
                                                ? darkModeController
                                                        .isLightTheme.value
                                                    ? ImageConfig.favourite
                                                    : ImageConfig
                                                        .favouriteUnfill
                                                : darkModeController
                                                        .isLightTheme.value
                                                    ? ImageConfig.likeFill
                                                    : ImageConfig.favouriteFill,
                                          ),
                                          width: SizeConfig.width20,
                                          height: SizeConfig.height20,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height06,
                          ),
                          Row(
                            children: [
                              Text(
                                TextString.mintShiner,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendLight,
                                  fontWeight: FontWeight.w300,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width10,
                              ),
                              Text(
                                TextString.off50,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendRegular,
                                  fontWeight: FontWeight.w400,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height12,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Text(
                                  TextString.dollar790Only,
                                  style: TextStyle(
                                    fontSize: FontSize.heading4,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontWeight: FontWeight.w500,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: SizeConfig.width08,
                                ),
                                Text(
                                  TextString.dollar1290,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                VerticalDivider(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.lineColor
                                      : ColorsConfig.lineDarkColor,
                                  endIndent: SizeConfig.indent7Point,
                                  indent: SizeConfig.indent7Point,
                                  width: SizeConfig.width30,
                                  thickness: 1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      TextString.rating4point5,
                                      style: TextStyle(
                                        fontSize: FontSize.body3,
                                        fontFamily: FontFamily.lexendRegular,
                                        fontWeight: FontWeight.w400,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width03,
                                    ),
                                    Image(
                                      image: const AssetImage(ImageConfig.star),
                                      width: SizeConfig.width12,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width06,
                                    ),
                                    Text(
                                      TextString.review1227,
                                      style: TextStyle(
                                        fontSize: FontSize.body3,
                                        fontFamily: FontFamily.lexendLight,
                                        fontWeight: FontWeight.w300,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          Text(
                            TextString.selectColor,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              fontWeight: FontWeight.w500,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              mainAxisExtent: SizeConfig.height35,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: fashionController.colorsList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  fashionController.selectColor(index);
                                },
                                child: Obx(
                                  () {
                                    final isSelected = fashionController
                                            .selectedColorIndex.value ==
                                        index;
                                    return Container(
                                      width: SizeConfig.width45,
                                      height: SizeConfig.height45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected
                                            ? darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.secondaryColor
                                                : ColorsConfig.primaryColor
                                            : darkModeController
                                                    .isLightTheme.value
                                                ? ColorsConfig.secondaryColor
                                                : Colors.transparent,
                                        border: Border.all(
                                          color: isSelected
                                              ? darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.textLightColor
                                                  : ColorsConfig.secondaryColor
                                              : darkModeController
                                                      .isLightTheme.value
                                                  ? Colors.transparent
                                                  : Colors.transparent,
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                            SizeConfig.padding04,
                                          ),
                                          child: Container(
                                            width: SizeConfig.width35,
                                            decoration: BoxDecoration(
                                              color: fashionController
                                                  .colorsList[index],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          Obx(
                            () {
                              final selectedSize =
                                  fashionController.selectedSize.value;
                              return Text(
                                "${TextString.selectSize}($selectedSize)",
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendMedium,
                                  fontWeight: FontWeight.w500,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              mainAxisExtent: SizeConfig.height35,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: fashionController.sizesList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  fashionController.selectSize(index);
                                },
                                child: Obx(
                                  () {
                                    final isSelected = fashionController
                                            .selectedSizeIndex.value ==
                                        index;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: SizeConfig.padding10,
                                      ),
                                      child: Container(
                                        width: SizeConfig.width45,
                                        height: SizeConfig.height45,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor
                                              : darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.secondaryColor
                                                  : ColorsConfig.primaryColor,
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.borderRadius08),
                                        ),
                                        child: Center(
                                          child: Text(
                                            fashionController.sizesList[index],
                                            style: TextStyle(
                                              fontSize: FontSize.body3,
                                              fontFamily: isSelected
                                                  ? FontFamily.lexendMedium
                                                  : FontFamily.lexendLight,
                                              fontWeight: isSelected
                                                  ? FontWeight.w500
                                                  : FontWeight.w300,
                                              color: isSelected
                                                  ? darkModeController
                                                          .isLightTheme.value
                                                      ? ColorsConfig
                                                          .secondaryColor
                                                      : ColorsConfig
                                                          .primaryColor
                                                  : darkModeController
                                                          .isLightTheme.value
                                                      ? ColorsConfig
                                                          .primaryColor
                                                      : ColorsConfig
                                                          .secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Container(
                            width: SizeConfig.width167,
                            height: SizeConfig.height22,
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding06,
                              right: SizeConfig.padding06,
                            ),
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.secondaryColor
                                : ColorsConfig.primaryColor,
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        TextString.shoulder,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                      Text(
                                        TextString.shoulder20,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.lineColor
                                        : ColorsConfig.lineDarkColor2,
                                    indent: 5,
                                    endIndent: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        TextString.chest,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                      Text(
                                        TextString.chest36,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: SizeConfig.height20,
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height10,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.lineColor.withOpacity(.4)
                          : ColorsConfig.buttonColor,
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height149,
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        top: SizeConfig.padding12,
                        bottom: SizeConfig.padding12,
                        right: SizeConfig.padding24,
                      ),
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.description,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              fontWeight: FontWeight.w500,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Text(
                            TextString.fashionDetailDescription,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendLight,
                              fontWeight: FontWeight.w300,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.textColor
                                  : ColorsConfig.modeInactiveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height10,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.lineColor.withOpacity(.4)
                          : ColorsConfig.buttonColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.offersView);
                      },
                      child: Container(
                        width: double.infinity,
                        height: SizeConfig.height48,
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding24,
                          top: SizeConfig.padding15,
                          bottom: SizeConfig.padding15,
                          right: SizeConfig.padding24,
                        ),
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.secondaryColor
                            : ColorsConfig.primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: const AssetImage(ImageConfig.offer),
                                  width: SizeConfig.width18,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                                const SizedBox(
                                  width: SizeConfig.width06,
                                ),
                                Text(
                                  TextString.offers,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendMedium,
                                    fontWeight: FontWeight.w500,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              TextString.offers15More,
                              style: TextStyle(
                                fontSize: FontSize.body3,
                                fontFamily: FontFamily.lexendLight,
                                fontWeight: FontWeight.w300,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height10,
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.lineColor.withOpacity(.4)
                          : ColorsConfig.buttonColor,
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height130,
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        top: SizeConfig.padding12,
                        bottom: SizeConfig.padding12,
                        right: SizeConfig.padding24,
                      ),
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.productDetails,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              fontWeight: FontWeight.w500,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding17,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: SizeConfig.width05,
                                  height: SizeConfig.height05,
                                  decoration: const BoxDecoration(
                                    color: ColorsConfig.textLightColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  TextString.regularFit,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                                Text(
                                  TextString.premiumCottonSilk.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height06,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding17,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: SizeConfig.width05,
                                  height: SizeConfig.height05,
                                  decoration: const BoxDecoration(
                                    color: ColorsConfig.textLightColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  TextString.packageContains,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                                Text(
                                  TextString.shirt1,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height06,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: SizeConfig.padding17,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: SizeConfig.width05,
                                  height: SizeConfig.height05,
                                  decoration: const BoxDecoration(
                                    color: ColorsConfig.textLightColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  TextString.machineWashCold,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendLight,
                                    fontWeight: FontWeight.w300,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                        top: SizeConfig.padding24,
                        bottom: SizeConfig.padding50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                TextString.customerReviews,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendMedium,
                                  fontWeight: FontWeight.w500,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.ratingAndReviewsView);
                                },
                                child: Text(
                                  TextString.seeMore,
                                  style: TextStyle(
                                    fontSize: FontSize.body3,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.textColor
                                        : ColorsConfig.modeInactiveColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.width44,
                                height: SizeConfig.height22,
                                decoration: BoxDecoration(
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.secondaryColor
                                      : ColorsConfig.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.borderRadius19),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      TextString.rating4point5,
                                      style: TextStyle(
                                        fontSize: FontSize.body3,
                                        fontFamily: FontFamily.lexendRegular,
                                        fontWeight: FontWeight.w400,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.primaryColor
                                            : ColorsConfig.secondaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: SizeConfig.width03,
                                    ),
                                    Image(
                                      image: const AssetImage(ImageConfig.star),
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                      width: SizeConfig.width12,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: SizeConfig.width10,
                              ),
                              Text(
                                TextString.ratingAndReviewTotal,
                                style: TextStyle(
                                  fontSize: FontSize.body2,
                                  fontFamily: FontFamily.lexendLight,
                                  fontWeight: FontWeight.w300,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.lineColor
                                : ColorsConfig.lineDarkColor,
                            height: SizeConfig.height32,
                            thickness: SizeConfig.lineThickness01,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                        image:
                                            AssetImage(ImageConfig.reviewMan1),
                                        width: SizeConfig.width32,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width10,
                                      ),
                                      Text(
                                        TextString.codyFisher,
                                        style: TextStyle(
                                          fontSize: FontSize.body2,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    TextString.days5Ago,
                                    style: TextStyle(
                                      fontSize: FontSize.body3,
                                      fontFamily: FontFamily.lexendLight,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: SizeConfig.height10,
                              ),
                              Image(
                                image: AssetImage(
                                  darkModeController.isLightTheme.value
                                      ? ImageConfig.ratings
                                      : ImageConfig.ratingDark,
                                ),
                                width: SizeConfig.width68,
                                height: SizeConfig.height12,
                              ),
                              const SizedBox(
                                height: SizeConfig.height06,
                              ),
                              Text(
                                TextString.review1,
                                style: TextStyle(
                                  fontSize: FontSize.body3,
                                  fontFamily: FontFamily.lexendLight,
                                  fontWeight: FontWeight.w300,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height08,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.likeFashion),
                                        width: SizeConfig.width14,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        TextString.like20,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width16,
                                  ),
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.dislikeFashion),
                                        width: SizeConfig.width14,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        TextString.dislike12,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                        image:
                                            AssetImage(ImageConfig.reviewMan2),
                                        width: SizeConfig.width32,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width10,
                                      ),
                                      Text(
                                        TextString.jacobJones,
                                        style: TextStyle(
                                          fontSize: FontSize.body2,
                                          fontFamily: FontFamily.lexendRegular,
                                          fontWeight: FontWeight.w400,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.primaryColor
                                              : ColorsConfig.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    TextString.month4Ago,
                                    style: TextStyle(
                                      fontSize: FontSize.body3,
                                      fontFamily: FontFamily.lexendLight,
                                      fontWeight: FontWeight.w300,
                                      color:
                                          darkModeController.isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: SizeConfig.height10,
                              ),
                              Image(
                                image: AssetImage(
                                  darkModeController.isLightTheme.value
                                      ? ImageConfig.ratings
                                      : ImageConfig.ratingDark,
                                ),
                                width: SizeConfig.width68,
                                height: SizeConfig.height12,
                              ),
                              const SizedBox(
                                height: SizeConfig.height06,
                              ),
                              Text(
                                TextString.review2,
                                style: TextStyle(
                                  fontSize: FontSize.body3,
                                  fontFamily: FontFamily.lexendLight,
                                  fontWeight: FontWeight.w300,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                              const SizedBox(
                                height: SizeConfig.height08,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.likeFashion),
                                        width: SizeConfig.width14,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        TextString.like20,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: SizeConfig.width16,
                                  ),
                                  Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            ImageConfig.dislikeFashion),
                                        width: SizeConfig.width14,
                                        color: darkModeController
                                                .isLightTheme.value
                                            ? ColorsConfig.textColor
                                            : ColorsConfig.modeInactiveColor,
                                      ),
                                      const SizedBox(
                                        width: SizeConfig.width04,
                                      ),
                                      Text(
                                        TextString.dislike12,
                                        style: TextStyle(
                                          fontSize: FontSize.body3,
                                          fontFamily: FontFamily.lexendLight,
                                          fontWeight: FontWeight.w300,
                                          color: darkModeController
                                                  .isLightTheme.value
                                              ? ColorsConfig.textColor
                                              : ColorsConfig.modeInactiveColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: SizeConfig.height115,
                      padding: const EdgeInsets.only(
                        top: SizeConfig.padding12,
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                        bottom: SizeConfig.padding12,
                      ),
                      color: darkModeController.isLightTheme.value
                          ? ColorsConfig.secondaryColor
                          : ColorsConfig.primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.returnPolicy,
                            style: TextStyle(
                              fontSize: FontSize.body2,
                              fontFamily: FontFamily.lexendMedium,
                              fontWeight: FontWeight.w500,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: SizeConfig.height10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: TextString.returnPolicyDescription,
                              style: TextStyle(
                                fontSize: FontSize.body2,
                                fontFamily: FontFamily.lexendLight,
                                fontWeight: FontWeight.w300,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.textColor
                                    : ColorsConfig.modeInactiveColor,
                              ),
                              children: [
                                TextSpan(
                                  text: TextString.clickHere,
                                  style: TextStyle(
                                    fontSize: FontSize.body2,
                                    fontFamily: FontFamily.lexendRegular,
                                    fontWeight: FontWeight.w400,
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.primaryColor
                                        : ColorsConfig.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        right: SizeConfig.padding24,
                        top: SizeConfig.padding40,
                        bottom: SizeConfig.padding40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                TextString.exploreNewProducts,
                                style: TextStyle(
                                  fontSize: FontSize.heading4,
                                  fontFamily: FontFamily.lexendMedium,
                                  fontWeight: FontWeight.w500,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.primaryColor
                                      : ColorsConfig.secondaryColor,
                                ),
                              ),
                              Text(
                                TextString.seeMore,
                                style: TextStyle(
                                  fontSize: FontSize.body3,
                                  fontFamily: FontFamily.lexendRegular,
                                  fontWeight: FontWeight.w400,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.textColor
                                      : ColorsConfig.modeInactiveColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: SizeConfig.height24,
                          ),
                          SizedBox(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 24,
                                crossAxisSpacing: 24,
                                mainAxisExtent: SizeConfig.height224,
                              ),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                final imageNewIndex = index;
                                return Container(
                                  width: SizeConfig.width159,
                                  padding: const EdgeInsets.all(
                                      SizeConfig.padding11),
                                  decoration: BoxDecoration(
                                    color: darkModeController.isLightTheme.value
                                        ? ColorsConfig.secondaryColor
                                        : ColorsConfig.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.borderRadius14),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                        child: Image(
                                          image: AssetImage(
                                            homeController
                                                .newArrivedImage[index],
                                          ),
                                          width: SizeConfig.width111,
                                          height: SizeConfig.height120,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            homeController
                                                .newArrivedTitle[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: FontSize.body2,
                                              fontFamily:
                                                  FontFamily.lexendMedium,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.primaryColor
                                                  : ColorsConfig.secondaryColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: SizeConfig.height02,
                                          ),
                                          Text(
                                            homeController
                                                .newArrivedSubtitle[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: FontSize.body3,
                                              fontFamily:
                                                  FontFamily.lexendLight,
                                              color: darkModeController
                                                      .isLightTheme.value
                                                  ? ColorsConfig.textColor
                                                  : ColorsConfig
                                                      .modeInactiveColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: SizeConfig.height10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                homeController
                                                    .newArrivedPrice[index],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: FontSize.body2,
                                                  fontFamily:
                                                      FontFamily.lexendMedium,
                                                  color: darkModeController
                                                          .isLightTheme.value
                                                      ? ColorsConfig
                                                          .primaryColor
                                                      : ColorsConfig
                                                          .secondaryColor,
                                                ),
                                              ),
                                              Obx(
                                                () => GestureDetector(
                                                  onTap: () {
                                                    homeController
                                                        .toggleArrival2Favorite(
                                                            imageNewIndex);
                                                  },
                                                  child: Image(
                                                    image: AssetImage(
                                                      homeController
                                                              .isFavouriteArrival2List[
                                                                  imageNewIndex]
                                                              .value
                                                          ? ImageConfig
                                                              .favourite
                                                          : ImageConfig
                                                              .likeFill,
                                                    ),
                                                    width: SizeConfig.width18,
                                                    color: darkModeController
                                                            .isLightTheme.value
                                                        ? ColorsConfig
                                                            .primaryColor
                                                        : ColorsConfig
                                                            .secondaryColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: SizeConfig.height94,
            width: double.infinity,
            decoration: BoxDecoration(
              color: darkModeController.isLightTheme.value
                  ? ColorsConfig.backgroundColor
                  : ColorsConfig.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: .1,
                  blurRadius: 15,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: SizeConfig.padding24,
                right: SizeConfig.padding24,
                top: SizeConfig.padding18,
                bottom: SizeConfig.padding24,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.paymentView);
                    },
                    child: Container(
                      height: SizeConfig.height52,
                      width: SizeConfig.width116,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadius14),
                        border: Border.all(
                          color: darkModeController.isLightTheme.value
                              ? ColorsConfig.primaryColor
                              : ColorsConfig.secondaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          TextString.textButtonBuyNow,
                          style: TextStyle(
                            fontSize: FontSize.body1,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.lexendRegular,
                            color: darkModeController.isLightTheme.value
                                ? ColorsConfig.primaryColor
                                : ColorsConfig.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: SizeConfig.width14,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        buttonController.toggleCartVisibility();
                        if (buttonController.buttonLabel.value ==
                            TextString.textButtonViewBag) {
                          goToTab(4);
                          buttonController.toggleContainer();
                          if (bottomNavigationController.selectedIndex == 4 &&
                              wishlistController.showFirstContent.value) {
                            bottomNavigationController.showBottomBar = false;
                          }
                          wishlistController.toggleContent();
                        }
                        if (buttonController.buttonLabel.value !=
                            TextString.textButtonViewBag) {
                          if (buttonController.showToast) {
                            buttonController.addToBag();
                            buttonController.showToast = false;
                          }
                        }
                      },
                      child: Obx(
                        () {
                          return Container(
                            height: SizeConfig.height52,
                            width: SizeConfig.width212,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.borderRadius14),
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.primaryColor
                                  : ColorsConfig.secondaryColor,
                            ),
                            child: Center(
                              child: Text(
                                buttonController.buttonLabel.value,
                                style: TextStyle(
                                  fontSize: FontSize.body1,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.lexendMedium,
                                  color: darkModeController.isLightTheme.value
                                      ? ColorsConfig.secondaryColor
                                      : ColorsConfig.primaryColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  buildDot({required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: SizeConfig.margin6),
      height: fashionController.currentPage.value == index
          ? SizeConfig.height06
          : SizeConfig.height06,
      width: fashionController.currentPage.value == index
          ? SizeConfig.width14
          : SizeConfig.width06,
      decoration: BoxDecoration(
        color: fashionController.currentPage.value == index
            ? darkModeController.isLightTheme.value
                ? ColorsConfig.primaryColor
                : ColorsConfig.secondaryColor
            : darkModeController.isLightTheme.value
                ? ColorsConfig.dotIndicatorColor
                : ColorsConfig.unRatedColor,
        borderRadius: BorderRadius.circular(SizeConfig.borderRadius39),
      ),
    );
  }
}
