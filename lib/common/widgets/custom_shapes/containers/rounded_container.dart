import 'package:flutter/material.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../utils/constants/colors.dart';

class IsmaRoundedContainer extends StatelessWidget {
  const IsmaRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = IsmaSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor = IsmaColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = IsmaColors.borderPrimary,
  });

    final double? width;
    final double? height;
    final double radius;
    final Widget? child;
    final bool showBorder;
    final Color borderColor;
    final Color backgroundColor;
    final EdgeInsetsGeometry? margin;
    final EdgeInsetsGeometry? padding;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
