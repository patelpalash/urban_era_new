import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/bottom_navigation_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/fashion_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/model/category_model.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/views/category/widget/categories_bottom_sheet.dart';

import '../../config/colors.dart';
import '../../config/font_family.dart';
import '../../config/font_size.dart';
import '../../config/image.dart';
import '../../config/size.dart';
import '../../config/text_string.dart';

class TopFashionView extends StatefulWidget {
  const TopFashionView({Key? key, required Category category})
      : super(key: key);

  @override
  State<TopFashionView> createState() => _TopFashionViewState();
}

class _TopFashionViewState extends State<TopFashionView> {
  FashionController fashionController = Get.put(FashionController());
  DarkModeController darkModeController = Get.put(DarkModeController());
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    setupScrollListener();
  }

  void setupScrollListener() {
    scrollController.removeListener(() {});
    scrollController.addListener(() {
      if (scrollController.offset > 92) {
        setState(() {
          fashionController.showTitle = true;
        });
      } else {
        setState(() {
          fashionController.showTitle = false;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void goToTab(int tabIndex) {
    bottomNavigationController.changePage(tabIndex);
    Get.toNamed(AppRoutes.bottomView);
  }

  @override
  Widget build(BuildContext context) {
    setupScrollListener();
    return Obx(() => Scaffold(
          backgroundColor: darkModeController.isLightTheme.value
              ? ColorsConfig.backgroundColor
              : ColorsConfig.buttonColor,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    elevation: 0,
                    snap: false,
                    pinned: true,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: fashionController.showTitle
                          ? Text(
                              TextString.topFashions,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.lexendMedium,
                                fontSize: FontSize.heading4,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.primaryColor
                                    : ColorsConfig.secondaryColor,
                              ),
                            )
                          : null,
                    ),
                    expandedHeight: 0,
                    backgroundColor: darkModeController.isLightTheme.value
                        ? ColorsConfig.backgroundColor
                        : ColorsConfig.buttonColor,
                    leading: Padding(
                      padding: const EdgeInsets.only(
                        left: SizeConfig.padding24,
                        top: SizeConfig.padding15,
                        bottom: SizeConfig.padding15,
                        right: SizeConfig.padding05,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          fashionController.resetState();
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
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: SizeConfig.padding24,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.fashionSearchView);
                              },
                              child: Image(
                                image: const AssetImage(ImageConfig.search),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: SizeConfig.padding24,
                            right: SizeConfig.padding24,
                            bottom: SizeConfig.padding60,
                          ),
                          child: SingleChildScrollView(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: SizeConfig.padding05),
                                  child: MasonryGridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 23,
                                    crossAxisSpacing: 23,
                                    itemCount:
                                        fashionController.fashionTitle.length,
                                    itemBuilder: (context, index) {
                                      if (index == 0) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              TextString.top,
                                              style: TextStyle(
                                                fontSize: FontSize.heading2,
                                                fontWeight: FontWeight.w300,
                                                fontFamily:
                                                    FontFamily.lexendLight,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                            ),
                                            Text(
                                              TextString.fashions,
                                              style: TextStyle(
                                                fontSize: FontSize.heading2,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    FontFamily.lexendSemiBold,
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig.primaryColor
                                                    : ColorsConfig
                                                        .secondaryColor,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        final imageIndex = index - 1;
                                        if (imageIndex % 2 == 0) {
                                          return Transform.translate(
                                            offset: const Offset(0, 5),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.toNamed(AppRoutes
                                                    .fashionDetailsView);
                                              },
                                              child: Container(
                                                width: SizeConfig.width159,
                                                padding: const EdgeInsets.only(
                                                  top: SizeConfig.padding12,
                                                  bottom: SizeConfig.padding16,
                                                  left: SizeConfig.padding12,
                                                  right: SizeConfig.padding12,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: darkModeController
                                                          .isLightTheme.value
                                                      ? ColorsConfig
                                                          .secondaryColor
                                                      : ColorsConfig
                                                          .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          SizeConfig
                                                              .borderRadius14),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Image(
                                                        image: AssetImage(
                                                            fashionController
                                                                    .fashionImageList[
                                                                imageIndex]),
                                                        width:
                                                            SizeConfig.width111,
                                                        height: SizeConfig
                                                            .height120,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height:
                                                          SizeConfig.height13,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          fashionController
                                                                  .fashionTitle[
                                                              imageIndex],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                FontSize.body2,
                                                            fontFamily: FontFamily
                                                                .lexendMedium,
                                                            color: darkModeController
                                                                    .isLightTheme
                                                                    .value
                                                                ? ColorsConfig
                                                                    .primaryColor
                                                                : ColorsConfig
                                                                    .secondaryColor,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: SizeConfig
                                                              .height02,
                                                        ),
                                                        Text(
                                                          fashionController
                                                                  .fashionSubtitle[
                                                              imageIndex],
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize:
                                                                FontSize.body3,
                                                            fontFamily:
                                                                FontFamily
                                                                    .lexendLight,
                                                            color: darkModeController
                                                                    .isLightTheme
                                                                    .value
                                                                ? ColorsConfig
                                                                    .textColor
                                                                : ColorsConfig
                                                                    .modeInactiveColor,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: SizeConfig
                                                              .height10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              fashionController
                                                                      .fashionPrice[
                                                                  imageIndex],
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    FontSize
                                                                        .body2,
                                                                fontFamily:
                                                                    FontFamily
                                                                        .lexendMedium,
                                                                color: darkModeController
                                                                        .isLightTheme
                                                                        .value
                                                                    ? ColorsConfig
                                                                        .primaryColor
                                                                    : ColorsConfig
                                                                        .secondaryColor,
                                                              ),
                                                            ),
                                                            Obx(
                                                              () =>
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  fashionController
                                                                      .toggleFavorite(
                                                                          imageIndex);
                                                                },
                                                                child: Image(
                                                                  image:
                                                                      AssetImage(
                                                                    fashionController
                                                                            .isFavouriteList[imageIndex]
                                                                            .value
                                                                        ? darkModeController.isLightTheme.value
                                                                            ? ImageConfig.favourite
                                                                            : ImageConfig.favouriteUnfill
                                                                        : darkModeController.isLightTheme.value
                                                                            ? ImageConfig.likeFill
                                                                            : ImageConfig.favouriteFill,
                                                                  ),
                                                                  width: SizeConfig
                                                                      .width18,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoutes.fashionDetailsView);
                                            },
                                            child: Container(
                                              width: SizeConfig.width159,
                                              padding: const EdgeInsets.only(
                                                top: SizeConfig.padding12,
                                                bottom: SizeConfig.padding16,
                                                left: SizeConfig.padding12,
                                                right: SizeConfig.padding12,
                                              ),
                                              decoration: BoxDecoration(
                                                color: darkModeController
                                                        .isLightTheme.value
                                                    ? ColorsConfig
                                                        .secondaryColor
                                                    : ColorsConfig.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        SizeConfig
                                                            .borderRadius14),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Image(
                                                      image: AssetImage(
                                                          fashionController
                                                                  .fashionImageList[
                                                              imageIndex]),
                                                      width:
                                                          SizeConfig.width111,
                                                      height:
                                                          SizeConfig.height120,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: SizeConfig.height13,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        fashionController
                                                                .fashionTitle[
                                                            imageIndex],
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              FontSize.body2,
                                                          fontFamily: FontFamily
                                                              .lexendMedium,
                                                          color: darkModeController
                                                                  .isLightTheme
                                                                  .value
                                                              ? ColorsConfig
                                                                  .primaryColor
                                                              : ColorsConfig
                                                                  .secondaryColor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height:
                                                            SizeConfig.height02,
                                                      ),
                                                      Text(
                                                        fashionController
                                                                .fashionSubtitle[
                                                            imageIndex],
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize:
                                                              FontSize.body3,
                                                          fontFamily: FontFamily
                                                              .lexendLight,
                                                          color: darkModeController
                                                                  .isLightTheme
                                                                  .value
                                                              ? ColorsConfig
                                                                  .textColor
                                                              : ColorsConfig
                                                                  .modeInactiveColor,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height:
                                                            SizeConfig.height10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            fashionController
                                                                    .fashionPrice[
                                                                imageIndex],
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: FontSize
                                                                  .body2,
                                                              fontFamily: FontFamily
                                                                  .lexendMedium,
                                                              color: darkModeController
                                                                      .isLightTheme
                                                                      .value
                                                                  ? ColorsConfig
                                                                      .primaryColor
                                                                  : ColorsConfig
                                                                      .secondaryColor,
                                                            ),
                                                          ),
                                                          Obx(
                                                            () =>
                                                                GestureDetector(
                                                              onTap: () {
                                                                fashionController
                                                                    .toggleFavorite(
                                                                        imageIndex);
                                                              },
                                                              child: Image(
                                                                image:
                                                                    AssetImage(
                                                                  fashionController
                                                                          .isFavouriteList[
                                                                              imageIndex]
                                                                          .value
                                                                      ? darkModeController
                                                                              .isLightTheme
                                                                              .value
                                                                          ? ImageConfig
                                                                              .favourite
                                                                          : ImageConfig
                                                                              .favouriteUnfill
                                                                      : darkModeController
                                                                              .isLightTheme
                                                                              .value
                                                                          ? ImageConfig
                                                                              .likeFill
                                                                          : ImageConfig
                                                                              .favouriteFill,
                                                                ),
                                                                width: SizeConfig
                                                                    .width18,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: SizeConfig.height48,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.buttonColor
                    : ColorsConfig.secondaryColor,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectCategoriesBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Image(
                              image: const AssetImage(ImageConfig.category),
                              width: SizeConfig.width16,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                            ),
                            const SizedBox(
                              width: SizeConfig.width06,
                            ),
                            Text(
                              TextString.categories,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.body2,
                                fontFamily: FontFamily.lexendMedium,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: darkModeController.isLightTheme.value
                            ? ColorsConfig.textLightColor
                            : ColorsConfig.modeInactiveColor,
                        indent: 15,
                        endIndent: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.filtersView);
                        },
                        child: Row(
                          children: [
                            Image(
                              image: const AssetImage(ImageConfig.filterData),
                              width: SizeConfig.width16,
                              color: darkModeController.isLightTheme.value
                                  ? ColorsConfig.secondaryColor
                                  : ColorsConfig.primaryColor,
                            ),
                            const SizedBox(
                              width: SizeConfig.width06,
                            ),
                            Text(
                              TextString.filters,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: FontSize.body2,
                                fontFamily: FontFamily.lexendMedium,
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
