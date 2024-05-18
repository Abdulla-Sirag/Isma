import 'package:flutter/material.dart';
import 'package:isma/common/widgets/appbar/appbar.dart';
import 'package:isma/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:isma/common/widgets/layouts/grid_layout.dart';
import 'package:isma/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:isma/common/widgets/texts/section_heading.dart';
import 'package:isma/features/shop/screens/store/widget/category_tab.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/products/product_cards/brand_card.dart';
import '../../../../utils/helpers/helper_functions.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: darkMode ? IsmaColors.black : IsmaColors.white,
        appBar: IsmaAppBar(
          title: Text ('Store', style: Theme.of(context).textTheme.headlineMedium),
          backgroundColor: Colors.transparent,
          actions: [
            IsmaCartCounterIcon(onPressed: () {}, ismaColor: IsmaColors.black, isCloredBar: false,)
          ],
          showBackArrow: false,
        ),
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: darkMode ? IsmaColors.black : IsmaColors.white,
              expandedHeight: 440,

              flexibleSpace: Padding(
                padding: const EdgeInsets.all(IsmaSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:  [
                    /// -- Search Bar
                    const SizedBox(height: IsmaSizes.spaceBtwItems),
                    const IsmaSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero,),
                    const SizedBox(height: IsmaSizes.spaceBtwSections),

                    /// -- Featured Brands
                    IsmaSectionHeading(title: 'Featured Brands', showActionButton: true, onPressed: () {},),
                    const SizedBox(height: IsmaSizes.spaceBtwItems / 1.5),

                    /// -- Brands GRID
                    IsmaGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
                      return const IsmaBrandCard(showBorder: true,);
                    })
                  ],
                ),
              ),

              /// Tabs
              bottom: const IsmaTabBar(tabs: [
                Tab(child: Text('Sports')),
                Tab(child: Text('Furniture')),
                Tab(child: Text('Electronics')),
                Tab(child: Text('Clothes')),
                Tab(child: Text('Cars')),
              ],),
          )
          ];

          /// Body
      }, body: const TabBarView(
            children: [
              IsmaCategoryTab(),
              IsmaCategoryTab(),
              IsmaCategoryTab(),
              IsmaCategoryTab(),
              IsmaCategoryTab(),
            ]),
        )
      ),
    );
  }
}




