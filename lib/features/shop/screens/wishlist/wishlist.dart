import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/common/widgets/appbar/appbar.dart';
import 'package:isma/common/widgets/icons/isma_circular_icon.dart';
import 'package:isma/common/widgets/layouts/grid_layout.dart';
import 'package:isma/features/shop/screens/home/home.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';




class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: darkMode ? IsmaColors.black : IsmaColors.white,
      appBar: IsmaAppBar(
        title: Text ('Wishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IsmaCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(() => const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(IsmaSizes.defaultSpace),
          child:  Column(
            children: [
              IsmaGridLayout(itemCount: 4, itemBuilder: (_, index) => const IsmaProductCardVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
