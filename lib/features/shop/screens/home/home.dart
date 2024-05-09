import 'package:flutter/material.dart';
import 'package:isma/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:isma/features/shop/screens/home/widgets/home_categories.dart';
import 'package:isma/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:isma/utils/constants/Image_strings.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            IsmaPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  IsmaHomeAppBar(),

                  /// -- SearchBar
                  IsmaSearchContainer(text: 'Search in Store'),
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
                  ),)
                ],
              ),
            ),
            /// Body
            Padding(
              padding: EdgeInsets.all(IsmaSizes.defaultSpace),
              child: IsmaPromoSlider(banners: [IsmaImages.banner1, IsmaImages.banner2, IsmaImages.banner3, ],),
            ),
          ],
        ),
      ),
    );
  }
}












