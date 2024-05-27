import 'package:flutter/material.dart';
import 'package:isma/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:isma/common/widgets/products/ratings/rating_indicator.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:isma/utils/constants/image_strings.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';



class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(IsmaImages.user),),
                const SizedBox(width: IsmaSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.bodyMedium,),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: IsmaSizes.spaceBtwItems),

        /// Reviews
        Row(
          children: [
            const IsmaRatingBarIndicator(rating: 4),
            const SizedBox(width: IsmaSizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: IsmaSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intiutive. I was able to navigate and make purchase seamlessly. Great job',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
        ),
        const SizedBox(height: IsmaSizes.spaceBtwItems),

        /// Company Review
        IsmaRoundedContainer(
          backgroundColor: darkMode ? IsmaColors.darkGrey : IsmaColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(IsmaSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ISMA Team', style: Theme.of(context).textTheme.bodyMedium,),
                    Text('02 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const ReadMoreText(
                  'The user interface of the app is quite intiutive. I was able to navigate and make purchase seamlessly. Great job',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
                ),
                const SizedBox(height: IsmaSizes.spaceBtwItems),
              ],
            ),
          ),
        ),
        const SizedBox(height: IsmaSizes.spaceBtwSections),
      ],
    );
  }
}
