import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/login/cubit/login_cubit.dart';
import 'package:flyfinder/screens/auth/screens/login/form_builders/login_form_keys.dart';
import 'package:flyfinder/templates/form/controls/form_text_field.dart';
import 'package:flyfinder/templates/form/layout/form_filled_button.dart';
import 'package:flyfinder/templates/form/layout/form_page.dart';
import 'package:flyfinder/templates/form/layout/form_sliver_gap.dart';

typedef _K = LoginKeys;

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => FormPage(
        isInitialized: state.initialized,
        formGroup: cubit.formGroup,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back',
                    style: context.headlineLarge,
                  ),
                  Text(
                    'Please enter your email and password to login.',
                    style: context.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const FormSliverGap(32),
          FormTextField<String>(
            formControlName: _K.login,
            label: 'Email',
            placeholder: 'Enter email',
            keyboardType: TextInputType.emailAddress,
          ),
          const FormSliverGap(),
          FormTextField<String>(
            formControlName: _K.password,
            label: 'Password',
            placeholder: 'Enter password',
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
          ),
          const FormSliverGap(),
          FormFilledButton(
            isPending: state.pending,
            onPressed: cubit.submit,
            text: 'Login',
          ),
          const FormSliverGap(),
          SliverToBoxAdapter(
            child: Text.rich(
              TextSpan(
                text: 'Forgotten your password?',
                style: context.bodyMedium,
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: 'Reset Password',
                    style: context.bodyMediumBold.copyWith(
                      color: context.primary,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
