import 'package:flutter/material.dart';
import 'package:isma/utils/device/device_utility.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';





class IsmaTabBar extends StatelessWidget implements PreferredSizeWidget {
  const IsmaTabBar({
    super.key,
    required this.tabs
  });

  final List<Widget> tabs;


  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Container(
      color: darkMode ? IsmaColors.black : IsmaColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: IsmaColors.primary,
          unselectedLabelColor: IsmaColors.darkGrey,
          labelColor: darkMode ? IsmaColors.white : IsmaColors.primary,
          tabs: tabs
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(IsmaDeviceUtils.getAppBarHeight());
}
