import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constants/colors.dart';

class IsmaCartCounterIcon extends StatelessWidget {
  const IsmaCartCounterIcon({
    super.key, required this.ismaColor, required this.onPressed,
  });

  final Color ismaColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: const Icon(Iconsax.shopping_bag, color: IsmaColors.white,)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: ismaColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: IsmaColors.white, fontSizeFactor: 0.8),),
            ),
          ),
        ),
      ],
    );
  }
}

