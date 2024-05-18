import 'package:flutter/material.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/isma_circular_image.dart';
import '../../texts/isma_brand_title_with_verified_icon.dart';



class IsmaBrandCard extends StatelessWidget {
  const IsmaBrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: IsmaRoundedContainer(
        padding: const EdgeInsets.all(IsmaSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// __ Icon
            Flexible(
              child: IsmaCircularImage(
                isNetworkImage: false,
                image: IsmaImages.google,
                backgroundColor: Colors.transparent,
                overlayColor: darkMode ? IsmaColors.white : IsmaColors.black,
              ),
            ),
            const SizedBox(width: IsmaSizes.spaceBtwItems / 2),

            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IsmaBrandTitleWithVerifiedIcon(
                    title: 'Lenovo',
                    brandTextSize: TextSizes.large,
                  ),
                  Text ('256 products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
