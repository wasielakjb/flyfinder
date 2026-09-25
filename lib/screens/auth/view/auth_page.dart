import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/app/router/app_router.gr.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/any_button_content.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsGeometry.symmetric(vertical: 48),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.primary,
                  ),
                  child: Image.asset(
                    'assets/app_icon.png',
                    height: 128,
                  ),
                ),
              ),
              Text(
                'FlyFinder',
                style: context.headlineLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'Let’s dive in into your account!',
                style: context.bodyLarge.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 48),
              Column(
                spacing: 24,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: AnyButtonContent(
                      fullWidth: true,
                      text: 'Continue with Google',
                      style: context.titleMedium,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: Image.asset(
                          'assets/google_logo.png',
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: context.onSurface,
                    ),
                    onPressed: () {},
                    child: AnyButtonContent(
                      fullWidth: true,
                      text: 'Continue with Apple',
                      style: context.titleMedium.copyWith(
                        color: context.surface,
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 9),
                        child: Image.asset(
                          'assets/apple_logo.png',
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () => context.pushRoute(const LoginRoute()),
                    child: const AnyButtonContent(
                      fullWidth: true,
                      text: 'Sign in with password',
                    ),
                  ),
                ],
              ),
              const Spacer(),
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
            ],
          ),
        ),
      ),
    );
  }
}
