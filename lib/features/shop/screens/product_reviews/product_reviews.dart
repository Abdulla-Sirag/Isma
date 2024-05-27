import 'package:flutter/material.dart';
import 'package:isma/common/widgets/appbar/appbar.dart';
import 'package:isma/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:isma/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';




class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// -- Appbar
      appBar: const IsmaAppBar(title: Text('Reviews and Ratings'),),

      /// -- Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(IsmaSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ratings and reviews are verified and are from people who use the same type of device that you use.'),
            const SizedBox(height: IsmaSizes.spaceBtwItems),

            /// Overall Product Ratings
            const IsmaOverallProductRating(),
            const IsmaRatingBarIndicator(rating: 3.5,),
            Text('12,612', style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: IsmaSizes.spaceBtwSections),

            /// User Reviews List
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
      ),
    );
  }
}

