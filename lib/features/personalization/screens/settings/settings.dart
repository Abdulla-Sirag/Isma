import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/common/widgets/appbar/appbar.dart';
import 'package:isma/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:isma/common/widgets/texts/section_heading.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: darkMode ? IsmaColors.black : IsmaColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            IsmaPrimaryHeaderContainer(
                child: Column(
              children: [
                /// AppBar
                IsmaAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: IsmaColors.white),
                  ),
                  showBackArrow: false,
                ),

                /// User Profile Card
                const IsmaUserProfileTile(),


                const SizedBox(height: IsmaSizes.spaceBtwSections),
              ],
            )),

            /// -- Body
            Padding(padding: const EdgeInsets.all(IsmaSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const IsmaSectionHeading(title: 'Account Settings' , showActionButton: false,),
                  const SizedBox(height: IsmaSizes.spaceBtwItems),

                  IsmaSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses' , subTitle: 'Set shopping delivery address', onTap: () {}),
                  IsmaSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Card' , subTitle: 'Add, remove products and move to checkout', onTap: () {}),
                  IsmaSettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders' , subTitle: 'In-progress and completed orders', onTap: () {}),
                  IsmaSettingsMenuTile(icon: Iconsax.bank, title: 'Bank Accounts' , subTitle: 'Withdraw balance to registered bank account', onTap: () {}),
                  IsmaSettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons' , subTitle: 'List of all the discounted coupons', onTap: () {}),
                  IsmaSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications' , subTitle: 'Set any kind on notification message', onTap: () {}),
                  IsmaSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy' , subTitle: 'Manage data usage and connected devices', onTap: () {}),


                  /// -- App Settings
                  const SizedBox(height: IsmaSizes.spaceBtwSections),
                  const IsmaSectionHeading(title: 'App Settings' , showActionButton: false,),
                  const SizedBox(height: IsmaSizes.spaceBtwItems),

                  IsmaSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data' , subTitle: 'Upload Data to your cloud firebase', onTap: () {}),
                  IsmaSettingsMenuTile(icon: Iconsax.location, title: 'Geolocation' , subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: true, onChanged: (value) {},
                  ),),
                  IsmaSettingsMenuTile(icon: Iconsax.security_user, title: 'Safe Mode' , subTitle: 'Search result is safe for all ages',
                    trailing: Switch(
                      value: false, onChanged: (value) {},
                    ),),
                  IsmaSettingsMenuTile(icon: Iconsax.image, title: 'HD Image Quality' , subTitle: 'Set image quality to be seen',
                    trailing: Switch(
                      value: false, onChanged: (value) {},
                    ),),

                  /// Logout Button
                  const SizedBox(height: IsmaSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // Adjust the radius as needed
                    ),
                    textStyle: const TextStyle(
                    // Customize text style (optional)
                    fontSize: 16,
                  ),),


                  onPressed: () {},
                  child: Text('Logout', style: TextStyle(color: darkMode ? IsmaColors.white : IsmaColors.black,),),
                ),),
                  const SizedBox(height: IsmaSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

