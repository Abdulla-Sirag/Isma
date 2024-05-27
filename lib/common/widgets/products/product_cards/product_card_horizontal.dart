import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/isma_circular_icon.dart';
import '../../images/isma_rounded_image.dart';
import '../../texts/isma_brand_title_with_verified_icon.dart';
import '../../texts/isma_product_price_text.dart';
import '../../texts/isma_product_title_text.dart';




class IsmaProductCardHorizontal extends StatelessWidget {
  const IsmaProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(const ProductDetail()),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(IsmaSizes.productImageRadius),
          color: darkMode ? IsmaColors.darkerGrey : IsmaColors.softGrey,
        ),
        child: Row(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            IsmaRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(IsmaSizes.sm),
              backgroundColor: darkMode ? IsmaColors.dark : IsmaColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: IsmaRoundedImage(
                      imageUrl: IsmaImages.productImage1,
                      applyImageRadius: true,
                      backgroundColor: darkMode ? IsmaColors.dark : IsmaColors.white,
                    ),
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

            /// -- Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: IsmaSizes.sm, left: IsmaSizes.sm),
                child: Column(
                  children: [
                    Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const IsmaProductTitleText(
                          title: 'New Lenovo Laptop',
                          smallSize: true,
                        ),
                        const SizedBox(height: IsmaSizes.spaceBtwItems / 2),
                        const IsmaBrandTitleWithVerifiedIcon(title: 'Lenovo',),

                        // Spacer(),
                        const SizedBox(height: IsmaSizes.spaceBtwItems / 2),

                        /// Price Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            /// Price
                            const Flexible(
                                child: IsmaProductPriceText(price: '925.0', padding: EdgeInsets.zero),),

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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}