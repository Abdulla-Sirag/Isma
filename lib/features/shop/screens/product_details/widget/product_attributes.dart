import 'package:flutter/material.dart';
import 'package:isma/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:isma/common/widgets/texts/isma_product_price_text.dart';
import 'package:isma/common/widgets/texts/section_heading.dart';
import 'package:isma/utils/constants/colors.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/texts/isma_product_title_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';



class IsmaProductAttributes extends StatelessWidget {
  const IsmaProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        IsmaRoundedContainer(
          padding: const EdgeInsets.all(IsmaSizes.md),
          backgroundColor: darkMode ? IsmaColors.darkGrey : IsmaColors.grey,
          child: Column(
            children: [
              /// Title, Price, Stock Statue
              Row(
                children: [
                  const Expanded(
                      child: IsmaSectionHeading(title: 'Variation', showActionButton: false,)),
                  const SizedBox(width: IsmaSizes.spaceBtwItems),

                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const IsmaProductTitleText(title: 'Price : ',smallSize: true, ),
                    
                            /// Actual Price
                            Text ('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                    
                    
                            /// Sale Price
                            const IsmaProductPriceText(price: '20'),
                          ],
                        ),
                        /// Stock
                        Row(
                          children: [
                            const IsmaProductTitleText(title: 'Stock : ', smallSize: true,),
                            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),

              /// Variation Description
              const IsmaProductTitleText(title: 'This is the Description of the Product and it can go up to max 4 lines.', smallSize: true, maxLines: 4,),
            ],
          ),
        ),
        const SizedBox(height: IsmaSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const IsmaSectionHeading(title: 'Colors', showActionButton: false,),
            const SizedBox(height: IsmaSizes.spaceBtwItems / 2),

            Wrap(
              spacing: 8,
              children: [
              
                IsmaChoiceChip(text: 'Green', selected: false, onSelected: (value) {},),
                IsmaChoiceChip(text: 'Blue', selected: true, onSelected: (value) {},),
                IsmaChoiceChip(text: 'Red', selected: false, onSelected: (value) {},),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const IsmaSectionHeading(title: 'Size', showActionButton: false,),
            const SizedBox(height: IsmaSizes.spaceBtwItems / 2),

            Wrap(
              spacing: 4,
              children: [

                IsmaChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {},),
                IsmaChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {},),
                IsmaChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {},),
              ],
            ),
          ],
        )

      ],
    );
  }
}

