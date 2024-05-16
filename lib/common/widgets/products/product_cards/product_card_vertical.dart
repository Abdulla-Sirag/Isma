import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/common/styles/shadows.dart';
import 'package:isma/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:isma/common/widgets/images/isma_rounded_image.dart';
import 'package:isma/utils/constants/Image_strings.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/isma_circular_icon.dart';
import '../../texts/isma_brand_title_with_verified_icon.dart';
import '../../texts/isma_product_price_text.dart';
import '../../texts/isma_product_title_text.dart';

class IsmaProductCardVertical extends StatelessWidget {
  const IsmaProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(color: IsmaColors.grey),
          boxShadow: [IsmaShadowsStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(IsmaSizes.productImageRadius),
          color: darkMode ? IsmaColors.darkerGrey : IsmaColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            IsmaRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(IsmaSizes.sm),
              backgroundColor: darkMode ? IsmaColors.dark : IsmaColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  const IsmaRoundedImage(
                    imageUrl: IsmaImages.productImage1,
                    applyImageRadius: true,
                  ),

                  /// -- Sale Tag
                  Positioned(
                    top: 12,
                    child: IsmaRoundedContainer(
                      radius: IsmaSizes.sm,
                      backgroundColor: IsmaColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: IsmaSizes.sm, vertical: IsmaSizes.xs),
                      child: Text('25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: IsmaColors.black)),
                    ),
                  ),

                  /// -- Favourite icon Button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: IsmaCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.red,
                      )),
                ],
              ),
            ),

            const SizedBox(height: IsmaSizes.spaceBtwItems / 2),

            /// -- Details
            const Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IsmaProductTitleText(
                      title: 'New Lenovo Laptop',
                      smallSize: true,
                    ),
                    SizedBox(height: IsmaSizes.spaceBtwItems / 2),
                    IsmaBrandTitleWithVerifiedIcon(title: 'Lenovo',),
                  ],
                )),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Price
                const IsmaProductPriceText(price: '35.0', isLarge: false,),

                /// Add To Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: IsmaColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(IsmaSizes.cardRadiusMd),
                      bottomRight:
                      Radius.circular(IsmaSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: IsmaSizes.iconLg * 1.2,
                    height: IsmaSizes.iconLg * 1.2,
                    child: Center(
                        child: Icon(
                          Iconsax.add,
                          color: IsmaColors.white,
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
