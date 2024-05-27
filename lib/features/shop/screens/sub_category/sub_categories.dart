import 'package:flutter/material.dart';
import 'package:isma/common/widgets/appbar/appbar.dart';
import 'package:isma/common/widgets/images/isma_rounded_image.dart';
import 'package:isma/features/shop/screens/sub_category/widgets/sub_category_widget.dart';
import 'package:isma/utils/constants/image_strings.dart';
import 'package:isma/utils/constants/sizes.dart';




class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: IsmaAppBar(
        title: Text('Laptops '),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(IsmaSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              IsmaRoundedImage(
                width: double.infinity,
                imageUrl: IsmaImages.banner1,
                applyImageRadius: true,
              ),
              SizedBox(height: IsmaSizes.spaceBtwSections),

              /// Sub Categories
              IsmaSubCategories(title: 'Apple laptops',),
              IsmaSubCategories(title: 'Lenovo laptops',),
              IsmaSubCategories(title: 'Asus laptops',),
              IsmaSubCategories(title: 'Acer laptops',),
              IsmaSubCategories(title: 'Dell laptops',),
              IsmaSubCategories(title: 'HP laptops',),
            ],
          ),
        ),
      ),
    );
  }
}

