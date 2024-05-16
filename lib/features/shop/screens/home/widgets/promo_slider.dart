import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/features/shop/controllers/home_controller.dart';
import 'package:isma/utils/constants/colors.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/isma_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';



class IsmaPromoSlider extends StatelessWidget {
  const IsmaPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items:banners.map((url) => IsmaRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: IsmaSizes.spaceBtwItems),
        Center(
          child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length; i++) IsmaCircularContainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carousalCurrentIndex.value == i ? IsmaColors.primary : IsmaColors.grey,)
              ],
            ),
          ),
        )
      ],
    );
  }
}


