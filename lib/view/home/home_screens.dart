import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/component/main_header.dart';
import 'package:my_grocery/controller/controllers.dart';

import 'components/carousel_slider/carousel_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
        children: [
          MainHeader(),
          Obx((){
            if(homeController.isBannerLoading.value){
              return CarouselLoading();
            }else{
              return CarouselLoading();
            }
          })
        ],
    )
    );
  }
}
