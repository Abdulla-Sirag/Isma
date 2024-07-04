
import 'package:flutter/material.dart';
import 'package:isma/features/authentication/screens/signup/widgets/signup_form.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';




class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(IsmaSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                IsmaTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: IsmaSizes.spaceBtwSections),

              /// Form
              const IsmaSignupForm(),
              const SizedBox(height: IsmaSizes.spaceBtwSections),

              /// Divider
              const IsmaFormDivider(dividerText: IsmaTexts.orSignUpWith),
              const SizedBox(height: IsmaSizes.spaceBtwSections),

              /// Social Buttons
              const IsmaSocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}


