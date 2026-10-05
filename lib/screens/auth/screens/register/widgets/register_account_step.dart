import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:flyfinder/templates/form/controls/form_checkbox.dart';
import 'package:flyfinder/templates/form/controls/form_text_field.dart';
import 'package:flyfinder/templates/form/layout/form_sliver_gap.dart';

typedef _K = RegisterKeys;

class RegisterAccountStep extends StatelessWidget {
  const RegisterAccountStep({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an account',
                  style: context.headlineLarge,
                ),
                Text(
                  'Sign up to unlock the best flights from around the world.',
                  style: context.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        const FormSliverGap(32),
        FormTextField<String>(
          formControlName: _K.email,
          label: 'Email',
          placeholder: 'Enter email',
          keyboardType: TextInputType.emailAddress,
        ),
        const FormSliverGap(),
        FormTextField<String>(
          formControlName: _K.password,
          label: 'Password',
          placeholder: 'Enter password',
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
        const FormSliverGap(),
        FormCheckbox(
          formControlName: _K.hasAcceptedTerms,
          child: Text.rich(
            TextSpan(
              text: 'I agree to FlyFinder',
              style: context.bodyLarge.copyWith(fontSize: 16),
              children: [
                const TextSpan(text: ' '),
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  text: 'Terms & Conditions',
                  style: context.bodyMediumBold.copyWith(
                    fontSize: 16,
                    color: context.primary,
                  ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
