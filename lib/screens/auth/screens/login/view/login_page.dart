import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/login/cubit/login_cubit.dart';
import 'package:flyfinder/screens/auth/screens/login/form_builders/login_form_keys.dart';
import 'package:flyfinder/templates/any_button_content.dart';
import 'package:flyfinder/templates/form/controls/form_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back',
                style: context.headlineLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'Please enter your email and password to sign in.',
                style: context.bodyLarge,
              ),
              const SizedBox(height: 48),
              ReactiveForm(
                formGroup: cubit.formGroup,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormTextField<String>(
                      formControlName: _K.login,
                      label: 'Email',
                      placeholder: 'Email',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validationMessages: {
                        ValidationMessage.required: (_) => 'Email is required',
                      },
                    ),
                    const SizedBox(height: 20),
                    FormTextField<String>(
                      formControlName: _K.password,
                      label: 'Password',
                      placeholder: 'Password',
                      obscureText: true,
                      prefixIcon: Icons.lock_outlined,
                      keyboardType: TextInputType.visiblePassword,
                      validationMessages: {
                        ValidationMessage.required: (_) =>
                            'Password is required',
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text('Remeber me', style: context.labelLarge),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password',
                      style: context.labelLarge.copyWith(
                        color: context.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: context.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: context.titleMedium.copyWith(
                              color: context.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  context.pushRoute(const RegisterRoute()),
                          ),
                        ],
                      ),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const AnyButtonContent(
                        fullWidth: true,
                        text: 'Sign in',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
