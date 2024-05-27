import 'package:flutter/material.dart';
import 'package:isma/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:isma/common/widgets/images/isma_circular_image.dart';
import 'package:isma/common/widgets/texts/isma_brand_title_with_verified_icon.dart';
import 'package:isma/common/widgets/texts/isma_product_price_text.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:isma/utils/constants/enums.dart';
import 'package:isma/utils/constants/image_strings.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../../common/widgets/texts/isma_product_title_text.dart';
import '../../../../../utils/helpers/helper_functions.dart';




class IsmaProductMetaData extends StatelessWidget {
  const IsmaProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Price and Sale Price
        Row(
          children: [
            /// Sale Tag
            IsmaRoundedContainer(
              radius: IsmaSizes.sm,
              backgroundColor: IsmaColors.secondary.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: IsmaSizes.sm, vertical: IsmaSizes.xs),
            child: Text ('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: IsmaColors.black)),
            ),
            const SizedBox(width: IsmaSizes.spaceBtwItems),

            /// Price
            Text ('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            // const SizedBox(width: IsmaSizes.spaceBtwItems),
            const IsmaProductPriceText(price: '175', isLarge: true,),
          ],
        ),
        const SizedBox(height: IsmaSizes.spaceBtwItems / 1.5),

        /// Title
        const IsmaProductTitleText(title: 'Lenovo X1 Carbon'),
        const SizedBox(height: IsmaSizes.spaceBtwItems / 1.5),

        /// Stack Status
        Row(
          children: [
            const IsmaProductTitleText(title: 'Status'),
            const SizedBox(width: IsmaSizes.spaceBtwItems),
            Text ('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: IsmaSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            IsmaCircularImage(image: IsmaImages.google,
                width: 32,
            height: 32,
            overlayColor: darkMode ? IsmaColors.white : IsmaColors.black, backgroundColor: Colors.transparent,),
            const IsmaBrandTitleWithVerifiedIcon(title: 'Lenovo', brandTextSize: TextSizes.medium,),
          ],
        ),

      ],
    );
  }
}



