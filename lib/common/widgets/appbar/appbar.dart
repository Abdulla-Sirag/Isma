import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/utils/constants/sizes.dart';
import 'package:isma/utils/device/device_utility.dart';

class IsmaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IsmaAppBar({super.key, this.title, this.showBackArrow = true, this.leadingIcon, this.actions, this.leadingOnPressed, this.backgroundColor});


  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: IsmaSizes.md),
      child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: showBackArrow
          ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left))
          : leadingIcon != null ?  IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
      : null,
      title: title,
      actions: actions,

    ),);
  }

  @override
  Size get preferredSize => Size.fromHeight(IsmaDeviceUtils.getAppBarHeight());
}
