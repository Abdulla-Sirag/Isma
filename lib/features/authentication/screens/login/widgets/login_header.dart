import 'package:flutter/material.dart';
import 'package:isma/utils/constants/image_strings.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';




class IsmaLoginHeader extends StatelessWidget {
  const IsmaLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = IsmaHelperFunctions.isDarkMode(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, bottom: 10),
            child: Image(height: 120,
              image: AssetImage(dark ? IsmaImages.lightAppLogo : IsmaImages.lightAppLogo),),
          ),
          Text(
            IsmaTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: IsmaSizes.sm),

          // Description Text
          Text(
            IsmaTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ]
    );
  }
}
