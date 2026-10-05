import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/register/cubit/register_cubit.dart';
import 'package:flyfinder/screens/auth/screens/register/models/register_steps.dart';
import 'package:flyfinder/screens/auth/screens/register/widgets/register_account_step.dart';
import 'package:flyfinder/screens/auth/screens/register/widgets/register_profile_step.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: this,
    );
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterSteps step = RegisterSteps.account;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) => ReactiveForm(
        formGroup: cubit.formGroup,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 64,
            leading: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: BackButton(
                onPressed: () async {
                  if (step != RegisterSteps.account) {
                    controller.jumpToPage(step.value - 2);
                    return;
                  }
                  await context.maybePop();
                },
              ),
            ),
          ),
          body: Skeletonizer(
            enabled: false,
            effect: ShimmerEffect(
              baseColor: context.surfaceContainerHigh,
              highlightColor: context.surfaceContainerHighest,
            ),
            child: PageView(
              onPageChanged: (value) => setState(() {
                step = RegisterSteps.fromInt(value + 1);
              }),
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                RegisterAccountStep(),
                RegisterProfileStep(),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: FilledButton(
                onPressed: () {
                  if (step == RegisterSteps.profile) {
                    return;
                  }
                  controller.jumpToPage(step.value);
                },
                child: const Text('Continue'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
