import 'package:flutter/material.dart';

import '../../../utils/constants/Image_strings.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class IsmaSocialButtons extends StatelessWidget {
  const IsmaSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: IsmaColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              width: IsmaSizes.iconMd,
              height: IsmaSizes.iconMd,
              image: AssetImage(IsmaImages.google),
            ),
            onPressed: () {
              // Implement Facebook Sign In functionality
            },
          ),
        ),
        const SizedBox(width: IsmaSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: IsmaColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              width: IsmaSizes.iconMd,
              height: IsmaSizes.iconMd,
              image: AssetImage(IsmaImages.facebook),
            ),
            onPressed: () {
              // Implement Facebook Sign In functionality
            },
          ),
        ),
      ],
    );
  }
  }
