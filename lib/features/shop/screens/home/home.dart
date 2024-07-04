import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:isma/features/shop/screens/all_products/all_products.dart';
import 'package:isma/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:isma/features/shop/screens/home/widgets/home_categories.dart';
import 'package:isma/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:isma/utils/constants/image_strings.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: darkMode ? IsmaColors.black : IsmaColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const IsmaPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  IsmaHomeAppBar(),

                  /// -- SearchBar
                  IsmaSearchContainer(text: 'Search in Store', padding: EdgeInsets.all(IsmaSizes.md),),
                  SizedBox(width: IsmaSizes.spaceBtwSections),

                  Padding(padding: EdgeInsets.only(left: IsmaSizes.defaultSpace),
                  child: Column(
                    children: [

                      /// -- Heading
                      IsmaSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: IsmaColors.white,),
                      SizedBox(height: IsmaSizes.spaceBtwItems),

                    /// -- Categories
                    IsmaHomeCategories(),
                    ],
                  ),),

                  SizedBox(height: IsmaSizes.spaceBtwSections),

                ],
              ),
            ),
            /// Body
            Padding(
              padding: const EdgeInsets.all(IsmaSizes.defaultSpace),

              child: Column(
                children: [

                  /// -- Promo Slider
                  const IsmaPromoSlider(banners: [IsmaImages.banner1, IsmaImages.banner2, IsmaImages.banner3, ],),
                  const SizedBox(height: IsmaSizes.spaceBtwSections),

                  IsmaSectionHeading(title: 'Popular Products', showActionButton: true, onPressed: () => Get.to(() => const AllProductsScreen()),),
                  const SizedBox(height: IsmaSizes.spaceBtwItems),

                  /// -- Popular Products
                  IsmaGridLayout(itemCount: 8, itemBuilder: (_, index) => const IsmaProductCardVertical(),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

