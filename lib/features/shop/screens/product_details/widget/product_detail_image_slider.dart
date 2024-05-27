import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/common/widgets/appbar/appbar.dart';
import 'package:isma/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:isma/common/widgets/icons/isma_circular_icon.dart';
import 'package:isma/common/widgets/images/isma_rounded_image.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:isma/utils/constants/image_strings.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';



class IsmaProductImageSlider extends StatelessWidget {
  const IsmaProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return IsmaCurvedEdgesWidget(
      child: Container(
        color: darkMode ? IsmaColors.darkerGrey : IsmaColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(height: 400, child: Padding(
              padding: EdgeInsets.all(IsmaSizes.productImageRadius * 2),
              child: Center(child: Image(image: AssetImage(IsmaImages.productImage1))),
            )),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left:   12,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: IsmaSizes.spaceBtwItems), itemCount: 6, itemBuilder: (_, index) => IsmaRoundedImage(
                  width: 80,
                  backgroundColor: darkMode ? IsmaColors.dark : IsmaColors.white,
                  border: Border.all(color: IsmaColors.primary),
                  padding: const EdgeInsets.all(IsmaSizes.sm),
                  imageUrl: IsmaImages.productImage1, ),),
              ),
            ),
            const IsmaAppBar(
              showBackArrow: true,
              actions: [
                IsmaCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
