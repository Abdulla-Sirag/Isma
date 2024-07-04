import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/features/shop/screens/sub_category/sub_categories.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class IsmaHomeCategories extends StatelessWidget {
  const IsmaHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // List of titles and images for the categories
    final List<Map<String, String>> categories = [
      {'title': 'Electronics', 'image': IsmaImages.electronics},
      {'title': 'Fashion', 'image': IsmaImages.fashion},
      {'title': 'Food', 'image': IsmaImages.food},
      {'title': 'Luggage', 'image': IsmaImages.luggage},
      {'title': 'Tools', 'image': IsmaImages.tools},
      {'title': 'Beauty', 'image': IsmaImages.beauty},
      {'title': 'Health', 'image': IsmaImages.health},
      {'title': 'Home', 'image': IsmaImages.home},
      {'title': 'Sports', 'image': IsmaImages.sport},
      {'title': 'Toys', 'image': IsmaImages.toys},
      {'title': 'Vehicles', 'image': IsmaImages.vehicles},
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return IsmaVerticalImageText(
            title: categories[index]['title']!,
            image: categories[index]['image']!,
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
