import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class IsmaHomeAppBar extends StatelessWidget {
  const IsmaHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IsmaAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text (IsmaTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: IsmaColors.grey),),
          Text (IsmaTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: IsmaColors.white),),
        ],
      ),
      actions: [
        IsmaCartCounterIcon(onPressed: () {}, ismaColor: IsmaColors.black,)
      ],
      backgroundColor: Colors.transparent,
    );
  }
}