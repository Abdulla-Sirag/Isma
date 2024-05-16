import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'isma_brand_title_text.dart';


class IsmaBrandTitleWithVerifiedIcon extends StatelessWidget {
  const IsmaBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.textColor,
    this.maxLines = 1,
    this.iconColor = IsmaColors.primary, // Assuming TColors.primary is a placeholder for a color
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small, // Assuming TextSizes is a custom enum or constant
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ), // Flexible
        const SizedBox(width: IsmaSizes.xs), // Adjust the width according to your needs
        Icon(Icons.verified, color: iconColor, size: IsmaSizes.iconXs), // Adjust size according to your needs
      ],
    );
  }
}

