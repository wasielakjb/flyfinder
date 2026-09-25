import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/register/cubit/register_cubit.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:flyfinder/templates/form/controls/form_checkbox.dart';
import 'package:flyfinder/templates/form/controls/form_text_field.dart';
import 'package:flyfinder/templates/form/layout/form_scaffold.dart';
import 'package:flyfinder/templates/form/layout/form_sliver_gap.dart';

typedef _K = RegisterKeys;

class RegisterAccountStep extends StatelessWidget {
  const RegisterAccountStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterCubit>();
    return FormScaffold(
      formGroup: cubit.formGroup,
      appBarTitle: 'Create an account',
      appBarSubtitle: 'Sign up to unlock the best flights from around the world.',
      slivers: [
        FormTextField<String>(
          formControlName: _K.login,
          label: 'Email',
          placeholder: 'Email',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const FormSliverGap(),
        FormTextField<String>(
          formControlName: _K.password,
          label: 'Password',
          placeholder: 'Password',
          prefixIcon: Icons.lock_outline,
          keyboardType: TextInputType.visiblePassword,
        ),
        const FormSliverGap(),
        FormCheckbox(
          formControlName: _K.hasAcceptedTerms,
          child: Text.rich(
            TextSpan(
              text: 'I agree to FlyFinder ',
              style: context.labelLarge,
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: context.labelLarge.copyWith(color: context.primary),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
