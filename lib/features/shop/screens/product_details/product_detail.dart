import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/features/shop/screens/product_details/widget/bottom_add_to_cart_widget.dart';
import 'package:isma/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:isma/features/shop/screens/product_details/widget/product_detail_image_slider.dart';
import 'package:isma/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:isma/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:isma/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:isma/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/texts/section_heading.dart';



class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const IsmaBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product Image slider
            const IsmaProductImageSlider(),

            /// -- Product Details
            Padding(padding: const EdgeInsets.only(right: IsmaSizes.defaultSpace, left: IsmaSizes.defaultSpace, bottom: IsmaSizes.defaultSpace),
              child: Column(
                children: [

                  /// -- Rating & and Share Button
                  const IsmaRatingAndShare(),

                  /// -- Price, Title, Stack & Brand
                  const IsmaProductMetaData(),
                  const SizedBox(height: IsmaSizes.spaceBtwItems),

                  /// -- Attributes
                  const IsmaProductAttributes(),
                  const SizedBox(height: IsmaSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Checkout'),
                            ),
                          ),
                  const SizedBox(height: IsmaSizes.spaceBtwSections),

                  /// -- Description
                  const IsmaSectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: IsmaSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Lenovo Laptop with a black color, FHD screen, 15.6, 16GB RAM, intel i7 second generation, 4GB graphics card, type c charging with a fingerprint security features. The laptop is available in red and grey colors also.',
                        trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' show more',
                    trimExpandedText: ' less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: IsmaSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: IsmaSectionHeading(title: 'Reviews (199)', showActionButton: false,)),
                      Expanded(
                        flex: 0,
                        child: IconButton(
                            onPressed: () => Get.to(() => const ProductReviewsScreen()),
                            icon: const Icon(Iconsax.arrow_right_3, size: 18,)),
                      ),
                    ],
                  ),
                  const SizedBox(height: IsmaSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

