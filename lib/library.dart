import 'package:flutter/material.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:isma/utils/constants/text_strings.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Text Widget:
        Text (IsmaTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: IsmaColors.grey),),
      ],
    );
  }
}
