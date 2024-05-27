  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/common/widgets/images/isma_circular_image.dart';
import 'package:isma/features/personalization/screens/profile/profile.dart';
import 'package:isma/utils/constants/image_strings.dart';
import '../../../../utils/constants/colors.dart';


class IsmaUserProfileTile extends StatelessWidget {
  const IsmaUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const IsmaCircularImage(image: IsmaImages.user, width: 50, height: 50, padding: 0, backgroundColor: Colors.transparent,),
      title: Text(
        'Abdulla Sirag',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: IsmaColors.white),
      ),
      subtitle: Text(
        '3body818@gmail.com',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: IsmaColors.white),
      ),
      trailing: IconButton(
        icon: const Icon(
          Iconsax.edit,
          color: IsmaColors.white,
        ),
        onPressed: () => Get.to(const ProfileScreen()),
      ),
    );
  }
}
