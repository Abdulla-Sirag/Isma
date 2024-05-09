import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class IsmaVerticalImageText extends StatelessWidget {
  const IsmaVerticalImageText({
    super.key, required this.title, required this.image, this.textColor = IsmaColors.white, this.backgroundColor = IsmaColors.white, this.onTap,
  });

  final String title, image;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = IsmaHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: IsmaSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(IsmaSizes.sm),
              decoration:  BoxDecoration(
                color: backgroundColor ?? (dark ? IsmaColors.black : IsmaColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover, color: dark ? IsmaColors.light : IsmaColors.dark,),
              ),
            ),

            const SizedBox(height : IsmaSizes.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: Text (title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: backgroundColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
    );
  }
}