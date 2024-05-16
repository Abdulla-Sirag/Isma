import 'package:flutter/material.dart';
import 'package:isma/common/widgets/layouts/grid_layout.dart';
import 'package:isma/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:isma/common/widgets/texts/section_heading.dart';
import '../../../../../common/widgets/products/product_cards/brand_show_case.dart';
import '../../../../../utils/constants/Image_strings.dart';
import '../../../../../utils/constants/sizes.dart';



class IsmaCategoryTab extends StatelessWidget {
  const IsmaCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(IsmaSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const IsmaBrandShowcase(images: [IsmaImages.productImage1, IsmaImages.productImage1, IsmaImages.productImage1],),
              const SizedBox(height: IsmaSizes.spaceBtwItems),

              /// --Products
              IsmaSectionHeading(title: 'You might like', onPressed: () {},),
              const SizedBox(height: IsmaSizes.spaceBtwItems),

              IsmaGridLayout(itemCount: 8, itemBuilder: (_, index) => const IsmaProductCardVertical()),
              const SizedBox(height: IsmaSizes.spaceBtwSections),
            ],
          ),),
      ],
    );
  }
}
