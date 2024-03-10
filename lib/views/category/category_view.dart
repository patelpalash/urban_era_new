// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/colors.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_family.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/font_size.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/config/text_string.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/category_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/controller/dark_mode_controller.dart';
import 'package:shoppers_ecommerce_flutter_ui_kit/routes/app_routes.dart';

import '../../config/image.dart';
import '../../config/size.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);

  CategoryController categoryController = Get.put(CategoryController());
  DarkModeController darkModeController = Get.put(DarkModeController());

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
        elevation: categoryController.showElevation.value ? 0 : 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(
            top: SizeConfig.padding10,
            left: SizeConfig.padding10,
          ),
          child: !categoryController.searchBoolean.value
              ? Text(
                TextString.categories,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.lexendMedium,
                  fontSize: FontSize.heading4,
                  color: darkModeController.isLightTheme.value
                      ? ColorsConfig.primaryColor
                      : ColorsConfig.secondaryColor,
                ),
              )
              : _searchTextField(),
        ),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.only(
              top: SizeConfig.padding10,
              right: SizeConfig.padding24,
            ),
            child: !categoryController.searchBoolean.value
                ? GestureDetector(
              onTap: () {
                categoryController.searchBoolean.value = true;
              },
              child: Image(
                image: const AssetImage(ImageConfig.search),
                width: SizeConfig.width20,
                height: SizeConfig.height20,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
            ) : GestureDetector(
              onTap: () {
                categoryController.searchBoolean.value = false;
              },
              child: Icon(
                Icons.clear_rounded,
                size: SizeConfig.width25,
                color: darkModeController.isLightTheme.value
                    ? ColorsConfig.primaryColor
                    : ColorsConfig.secondaryColor,
              ),
            ),
          )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: SizeConfig.padding24,
          right: SizeConfig.padding24,
          bottom: SizeConfig.padding15,
        ),
        child: ListView.builder(
          controller: categoryController.scrollController,
          shrinkWrap: true,
          itemCount: categoryController.categoriesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: SizeConfig.padding28),
              child: GestureDetector(
                onTap: () {
                  if(index == 0) {
                    Get.toNamed(AppRoutes.topFashionView);
                  }
                },
                child: Stack(
                  children: [
                    Container(
                      height: SizeConfig.height104,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius14),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (index % 2 == 0)
                            Container(
                              alignment: Alignment.centerRight,
                              width: double.infinity,
                              height: SizeConfig.height92,
                              padding: const EdgeInsets.only(
                                left: SizeConfig.padding100,
                                right: SizeConfig.padding12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                              ),
                              child: Container(
                                width: SizeConfig.width205,
                                margin: const EdgeInsets.only(
                                  left: SizeConfig.padding18,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      categoryController.categoriesList[index],
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
                                      height: SizeConfig.height04,
                                    ),
                                    Text(
                                      categoryController.categoriesSubTitle[index],
                                      style: TextStyle(
                                        fontSize: FontSize.body3,
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
                            ),
                          if (index % 2 != 0)
                            Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: SizeConfig.height92,
                              padding: const EdgeInsets.only(
                                left: SizeConfig.padding12,
                                right: SizeConfig.padding12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.borderRadius14),
                                color: darkModeController.isLightTheme.value
                                    ? ColorsConfig.secondaryColor
                                    : ColorsConfig.primaryColor,
                              ),
                              child: Container(
                                width: SizeConfig.width187,
                                margin: const EdgeInsets.only(
                                  right: SizeConfig.padding18,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      categoryController.categoriesList[index],
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
                                      height: SizeConfig.height04,
                                    ),
                                    Text(
                                      categoryController.categoriesSubTitle[index],
                                      style: TextStyle(
                                        fontSize: FontSize.body3,
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
                            ),
                        ],
                      ),
                    ),
                    if (index % 2 == 0)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: SizeConfig.padding12,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image(
                            image: AssetImage(
                                categoryController.categoriesImageList[index]),
                            height: SizeConfig.height104,
                            width: SizeConfig.width98,
                          ),
                        ),
                      ),
                    if (index % 2 != 0)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: SizeConfig.padding12,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image(
                            image: AssetImage(
                                categoryController.categoriesImageList[index]),
                            height: SizeConfig.height104,
                            width: SizeConfig.width98,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }

  Widget _searchTextField() {
    return TextField(
      autofocus: true,
      cursorColor: darkModeController.isLightTheme.value
            ? ColorsConfig.primaryColor
            : ColorsConfig.secondaryColor,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.lexendLight,
        fontSize: FontSize.body1,
        color: darkModeController.isLightTheme.value
            ? ColorsConfig.primaryColor
            : ColorsConfig.secondaryColor,
      ),
      decoration: InputDecoration(
        hintText: TextString.searchHere,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.lexendLight,
          fontSize: FontSize.body1,
          color: darkModeController.isLightTheme.value
              ? ColorsConfig.textColor
              : ColorsConfig.modeInactiveColor,
        ),
      ),
    );
  }
}
