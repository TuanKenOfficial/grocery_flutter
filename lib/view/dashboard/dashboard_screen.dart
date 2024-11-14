import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:my_grocery/controller/dashboard_controller.dart';
import 'package:my_grocery/view/account/account_screen.dart';
import 'package:my_grocery/view/category/category_screen.dart';
import 'package:my_grocery/view/home/home_screens.dart';
import 'package:my_grocery/view/product/product_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeScreen(),
              ProductScreen(),
              CategoryScreen(),
              AccountScreen(),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.orange,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 0.8))),
          child: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: TextStyle(fontSize: 1),
            snakeViewColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showSelectedLabels: true,
            currentIndex: controller.tabIndex,
            onTap: (val) {
              controller.updateIndex(val);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Account'),
            ],
          ),
        ),
      ),
    );
  }
}
