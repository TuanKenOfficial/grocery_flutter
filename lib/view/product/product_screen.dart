import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/component/main_header.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/product/components/product_grid.dart';
import 'package:my_grocery/view/product/components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(child: Obx(() {
            if (productController.isProductLoading.value) {
              print('1');
              return const ProductLoadingGrid();
            } else {
              if (productController.productList.isNotEmpty) {
                print('2');
                return ProductGrid(products: productController.productList);
              } else {
                return Column(
                  children: [
                    Image.asset('assets/product_not_found.jpg'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Không có sản phẩm'),
                  ],
                );
              }
            }
          }))
        ],
      ),
    );
  }
}
