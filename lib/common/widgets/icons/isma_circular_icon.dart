import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class IsmaCircularIcon extends StatelessWidget {
  /// A constum circular icon widget with a background color.

  const IsmaCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.icon,
    this.color = Colors.white,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width;
  final double? height;
  final double? size;
  final IconData icon;
  final Color color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : darkMode
                ? IsmaColors.black.withOpacity(0.9)
                : IsmaColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: size),
        onPressed: onPressed,
      ),
    );
  }
}
