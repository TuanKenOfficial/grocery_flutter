import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/component/main_header.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:my_grocery/view/home/components/popular_category/popular_category_loading.dart';
import 'package:my_grocery/view/home/components/popular_product/popular_product.dart';
import 'package:my_grocery/view/home/components/popular_product/popular_product_loading.dart';
import 'package:my_grocery/view/home/components/section_title.dart';

import 'components/carousel_slider/carousel_loading.dart';
import 'components/popular_category/popular_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        MainHeader(),
        Expanded(child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx(() {
                if (homeController.bannerList.isNotEmpty) {
                  return CarouselSliderView(bannerList: homeController.bannerList);
                } else {
                  return CarouselLoading();
                }
              }),
              const SectionTitle(title: "Danh mục phổ biến"),
              //popular category
              Obx(() {
                if (homeController.popularCategoryList.isNotEmpty) {
                  return PopularCategory(categories: homeController.popularCategoryList);
                } else {
                  return PopularCategoryLoading();
                }
              }),
              const SectionTitle(title: "Sản phẩm phổ biến"),
              //popular category
              Obx(() {
                if (homeController.popularProductList.isNotEmpty) {
                  return PopularProduct(popularProducts: homeController.popularProductList);
                } else {
                  return PopularProductLoading();
                }
              })
            ],
          ),
        )),
      ],
    ));
  }
}
