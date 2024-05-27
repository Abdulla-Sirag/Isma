import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/common/widgets/appbar/appbar.dart';
import 'package:isma/utils/constants/sizes.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';




class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IsmaAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(IsmaSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: ['Name', 'High Price', 'Low Price', 'Sale', 'Newest', 'Popularity',].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
                  ),
              const SizedBox(height: IsmaSizes.spaceBtwSections),

              IsmaGridLayout(itemCount: 8, itemBuilder: (_, index) => const IsmaProductCardVertical(),),
            ],
          ),
        ),
      ),
    );
  }
}
