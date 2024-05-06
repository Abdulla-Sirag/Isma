import 'package:flutter/material.dart';
import 'package:isma/common/styles/ispacing_styles.dart';
import 'package:isma/features/authentication/screens/login/widgets/login_form.dart';
import 'package:isma/features/authentication/screens/login/widgets/login_header.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  IsmaSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & sub-Title
            IsmaLoginHeader(),

              /// Login Form
              IsmaLoginForm(),

              /// Divider
              IsmaFormDivider(dividerText: IsmaTexts.orSignInWith),
              SizedBox(height: IsmaSizes.spaceBtwInputFields),

              /// Social Buttons Row
              IsmaSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}




