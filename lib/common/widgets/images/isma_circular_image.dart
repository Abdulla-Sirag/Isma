import 'package:flutter/material.dart';
import '../../../utils/constants/Image_strings.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class IsmaCircularImage extends StatelessWidget {
  const IsmaCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = IsmaSizes.sm,
    required this.image,
    required this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  final double width, height, padding;
  final String image;
  final Color backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (darkMode ? IsmaColors.black : IsmaColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(IsmaImages.google) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
