import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/common/widgets/icons/isma_circular_icon.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';




class IsmaBottomAddToCart extends StatelessWidget {
  const IsmaBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: IsmaSizes.defaultSpace, vertical: IsmaSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color:  darkMode ? IsmaColors.darkerGrey : IsmaColors.light,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(IsmaSizes.cardRadiusLg), topRight:  Radius.circular(IsmaSizes.cardRadiusLg))),

      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const IsmaCircularIcon(icon: Iconsax.minus,
                backgroundColor: IsmaColors.darkGrey,
                width: 40,
                    height: 40,
                  color: IsmaColors.white,),
                const SizedBox(width: IsmaSizes.spaceBtwItems),
                Text(
                  '2',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: IsmaSizes.spaceBtwItems),
            
                const IsmaCircularIcon(icon: Iconsax.add,
                  backgroundColor: IsmaColors.black,
                  width: 40,
                  height: 40,
                  color: IsmaColors.white,),
            
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(IsmaSizes.md),
                backgroundColor: IsmaColors.black,
                side: const BorderSide(color: IsmaColors.black),
              ),
              child: const Text('Add to Cart')
          ),
        ],
      ),

    );
  }
}
