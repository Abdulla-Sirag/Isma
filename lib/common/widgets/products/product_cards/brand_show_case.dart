import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';



class IsmaBrandShowcase extends StatelessWidget {
  const IsmaBrandShowcase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {

    return IsmaRoundedContainer(
      showBorder: true,
      borderColor: IsmaColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(IsmaSizes.md),
      margin: const EdgeInsets.only(bottom: IsmaSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const IsmaBrandCard(showBorder: false,),
          const SizedBox(height: IsmaSizes.spaceBtwItems),

          /// Brand Top 3 Products Images
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Expanded(
      child: IsmaRoundedContainer(
        height: 100,
        backgroundColor: darkMode ? IsmaColors.darkerGrey : IsmaColors.light,
        margin: const EdgeInsets.only(right: IsmaSizes.sm),
        padding: const EdgeInsets.all(IsmaSizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image),),
      ),
    );
  }
}
