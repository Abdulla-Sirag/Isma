import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/features/shop/screens/home/home.dart';
import 'package:isma/features/shop/screens/store/store.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:isma/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());

    Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Obx(
          () => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        backgroundColor: darkMode ? IsmaColors.black : IsmaColors.white,
        indicatorColor: darkMode ? IsmaColors.white.withOpacity(0.1) : IsmaColors.black.withOpacity(0.1),
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconsax.home,),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.shop,),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.heart,),
            label: 'WhishList',
          ),
          NavigationDestination(
            icon: Icon(Iconsax.user,),
            label: 'Profile',
          ),
        ],
      ),
      ),
      body: Obx(()  => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), const StoreScreen(),
    Container(color: Colors.orange), Container(color: Colors.brown)];
}