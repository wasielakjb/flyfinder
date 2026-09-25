import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/screens/auth/screens/register/cubit/register_cubit.dart';
import 'package:flyfinder/screens/auth/screens/register/widgets/register_profile_step.dart';

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
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const RegisterProfileStep();
    
    // Scaffold(
    //   appBar: AppBar(
    //     leading: BackButton(
    //       onPressed: () async {
    //         if (currentPage == 0) {
    //           context.back();
    //           return;
    //         }
    //         await controller.previousPage(
    //           duration: const Duration(milliseconds: 300),
    //           curve: Curves.ease,
    //         );
    //       },
    //     ),
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         Expanded(
    //           child: PageView(
    //             controller: controller,
    //             onPageChanged: (value) => setState(() {
    //               currentPage = value;
    //             }),
    //             physics: const NeverScrollableScrollPhysics(),
    //             children: const [
    //               RegisterAccountStep(),
    //               RegisterProfileStep(),
    //             ],
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 24),
    //           child: FilledButton(
    //             onPressed: () => controller.nextPage(
    //               duration: const Duration(milliseconds: 300),
    //               curve: Curves.ease,
    //             ),
    //             child: const AnyButtonContent(
    //               fullWidth: true,
    //               text: 'Continue',
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             'Create an account',
    //             style: context.headlineLarge,
    //           ),
    //           const SizedBox(height: 20),
    //           Text(
    //             'Sign up to unlock the best flights from around the world.',
    //             style: context.bodyLarge,
    //           ),
    //           const SizedBox(height: 48),
    //           ReactiveForm(
    //             formGroup: cubit.formGroup,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 FormTextField<String>(
    //                   formControlName: _K.login,
    //                   label: 'Email',
    //                   placeholder: 'Email',
    //                   prefixIcon: Icons.email_outlined,
    //                   keyboardType: TextInputType.emailAddress,
    //                   validationMessages: {
    //                     ValidationMessage.required: (_) => 'Email is required',
    //                   },
    //                 ),
    //                 const SizedBox(height: 20),
    //                 FormTextField<String>(
    //                   formControlName: _K.password,
    //                   label: 'Password',
    //                   placeholder: 'Password',
    //                   obscureText: true,
    //                   prefixIcon: Icons.lock_outlined,
    //                   keyboardType: TextInputType.visiblePassword,
    //                   validationMessages: {
    //                     ValidationMessage.required: (_) =>
    //                         'Password is required',
    //                   },
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           Row(
    //             children: [
    //               Checkbox(
    //                 value: false,
    //                 onChanged: (value) {},
    //               ),
    //               Text.rich(
    //                 TextSpan(
    //                   text: 'I agree to FlyFinder ',
    //                   style: context.titleMedium,
    //                   children: [
    //                     TextSpan(
    //                       text: 'Terms & Conditions',
    //                       style: context.titleMedium.copyWith(
    //                         color: context.primary,
    //                       ),
    //                     ),
    //                     const TextSpan(text: '.'),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           const SizedBox(height: 48),
    //           Expanded(
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text.rich(
    //                   TextSpan(
    //                     text: 'Already have an account? ',
    //                     style: context.titleMedium,
    //                     children: [
    //                       TextSpan(
    //                         text: 'Sign in',
    //                         style: context.titleMedium.copyWith(
    //                           color: context.primary,
    //                         ),
    //                         recognizer: TapGestureRecognizer()
    //                           ..onTap = () =>
    //                               context.pushRoute(const LoginRoute()),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 FilledButton(
    //                   onPressed: () {},
    //                   child: const AnyButtonContent(
    //                     fullWidth: true,
    //                     text: 'Continue',
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
