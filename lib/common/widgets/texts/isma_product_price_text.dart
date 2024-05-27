import 'package:flutter/material.dart';



class IsmaProductPriceText extends StatelessWidget {


  const IsmaProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
    this.padding = const EdgeInsets.only(left: 20),
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(currencySign + price,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: isLarge
            ?  Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
