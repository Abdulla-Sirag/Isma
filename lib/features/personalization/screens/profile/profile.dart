import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/common/widgets/appbar/appbar.dart';
import 'package:isma/common/widgets/images/isma_circular_image.dart';
import 'package:isma/common/widgets/texts/section_heading.dart';
import 'package:isma/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:isma/utils/constants/image_strings.dart';
import 'package:isma/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = IsmaHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: darkMode ? IsmaColors.black : IsmaColors.white,
      appBar: const IsmaAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(IsmaSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const IsmaCircularImage(image: IsmaImages.user, backgroundColor: Colors.transparent, width: 80, height: 80,),
                    TextButton(onPressed: () {}, child: Text('Change Profile Picture', style: TextStyle(color: darkMode ? IsmaColors.white : IsmaColors.black),)),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: IsmaSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: IsmaSizes.spaceBtwItems),
              const IsmaSectionHeading(title: 'Profile Information', showActionButton: false,),

              IsmaProfileMenu(title: 'Name', value: 'Abdulla Sirag Bashir', onPressed: () {},),
              IsmaProfileMenu(title: 'Username', value: 'Abdulla Sirag', onPressed: () {},),

              const SizedBox(height: IsmaSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: IsmaSizes.spaceBtwItems),

              /// Heading Personal Info
              const IsmaSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: IsmaSizes.spaceBtwSections),

              IsmaProfileMenu(title: 'User ID', value: '45689', icon: Iconsax.copy, onPressed: () {},),
              IsmaProfileMenu(title: 'E-mail', value: '3body818@gmail.com', onPressed: () {},),
              IsmaProfileMenu(title: 'Phone Number', value: '+256-76144219', onPressed: () {},),
              IsmaProfileMenu(title: 'Gender', value: 'Male', onPressed: () {},),
              IsmaProfileMenu(title: 'Date of Birth', value: '03 Nov, 1992', onPressed: () {},),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

