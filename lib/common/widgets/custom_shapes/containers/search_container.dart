import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class IsmaSearchContainer extends StatelessWidget {
  const IsmaSearchContainer({
    super.key, required this.text, this.icon = Iconsax.search_normal, this.showBackground = true, this.showBorder = true, this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(IsmaSizes.md),
        child: Container(
            width: IsmaDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(IsmaSizes.md),
            decoration: BoxDecoration(
                color: showBackground ? darkMode ? IsmaColors.dark : IsmaColors.light : Colors.transparent,
                border: showBorder ? Border.all(color: IsmaColors.grey) : null,
                borderRadius: BorderRadius.circular(IsmaSizes.cardRadiusLg)),
            child: Row(
              children: [
                Icon(icon, color: IsmaColors.darkGrey,),
                const SizedBox(width: IsmaSizes.spaceBtwItems),
                Text(text,
                    style: Theme.of(context).textTheme.bodySmall!.apply(color: IsmaColors.darkGrey)),
              ],
            )
        ),
      ),
    );
  }
}
