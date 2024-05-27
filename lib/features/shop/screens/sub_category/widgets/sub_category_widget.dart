import 'package:flutter/material.dart';
import 'package:isma/common/widgets/texts/section_heading.dart';
import 'package:isma/utils/constants/sizes.dart';

import '../../../../../common/widgets/products/product_cards/product_card_horizontal.dart';



class IsmaSubCategories extends StatelessWidget {
  const IsmaSubCategories({
    super.key, required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Heading
        IsmaSectionHeading(
          title: title,
          onPressed: () {},
        ),


        const SizedBox(height: IsmaSizes.spaceBtwItems / 2),


        SizedBox(
          height: 120,
          child: ListView.separated(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // physics: const AlwaysScrollableScrollPhysics(),
            separatorBuilder: (context, index) =>
            const SizedBox(width: IsmaSizes.spaceBtwItems),
            itemCount: 6,
            itemBuilder: (context, index) =>
            const IsmaProductCardHorizontal(),
          ),
        ),

        const SizedBox(height: IsmaSizes.spaceBtwItems),
      ],
    );
  }
}
