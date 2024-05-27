import 'package:flutter/material.dart';
import 'package:isma/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';

class IsmaOverallProductRating extends StatelessWidget {
  const IsmaOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text('4.8', style: Theme.of(context).textTheme.displayLarge,)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              IsmaRatingProgressIndicator(text: '5', value: 1),
              IsmaRatingProgressIndicator(text: '4', value: 0.8),
              IsmaRatingProgressIndicator(text: '3', value: 0.6),
              IsmaRatingProgressIndicator(text: '2', value: 0.4),
              IsmaRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
