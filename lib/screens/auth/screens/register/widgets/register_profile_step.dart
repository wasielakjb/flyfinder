import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/screens/auth/screens/register/cubit/register_cubit.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:flyfinder/templates/form/controls/form_profile_image_picker.dart';
import 'package:flyfinder/templates/form/controls/form_text_field.dart';
import 'package:flyfinder/templates/form/controls/phone_number/form_phone_number_field.dart';
import 'package:flyfinder/templates/form/layout/form_scaffold.dart';
import 'package:flyfinder/templates/form/layout/form_sliver_gap.dart';

typedef _K = RegisterKeys;

class RegisterProfileStep extends StatelessWidget {
  const RegisterProfileStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return FormScaffold(
      formGroup: cubit.formGroup,
      appBarTitle: 'Set up your profile',
      appBarSubtitle: 'Add a few details. Your information is always kept safe.',
      slivers: [
        FormProfileImagePicker<File>(
          formControlName: _K.image,
        ),
        const FormSliverGap(),
        FormTextField<String>(
          formControlName: _K.fullName,
          label: 'Full Name',
          placeholder: 'Full name',
          prefixIcon: Icons.person_outline,
          keyboardType: TextInputType.name,
        ),
        const FormSliverGap(),
        FormPhoneNumberField(
          formControlName: _K.phoneNumber, 
          label: 'Phone Number',
          placeholder: 'Phone number',
          prefixIcon: Icons.phone_outlined,
        ),

        SliverToBoxAdapter(
          child: FilledButton(
            onPressed: () {
              cubit.formGroup.markAllAsTouched();
            },
            child: null,
          ),
        ),
      ],
    );

    // Padding(
    //   padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         'Set up your profile',
    //         style: context.headlineLarge,
    //       ),
    //       const SizedBox(height: 20),
    //       Text(
    //         'Add a few details. Your information is always kept safe.',
    //         style: context.bodyLarge,
    //       ),
    //       const SizedBox(height: 48),
    //       ReactiveForm(
    //         formGroup: cubit.formGroup,
    //         child: CustomScrollView(
    //           slivers: [
    //             FormProfileImagePicker<String>(
    //               formControlName: _K.image,
    //             ),
    //             // const SizedBox(height: 32),
    //             // FormTextField<String>(
    //             //   formControlName: _K.fullName,
    //             //   label: 'Full Name',
    //             //   placeholder: 'Full Name',
    //             //   prefixIcon: Icons.person_outline,
    //             // ),
    //             // const SizedBox(height: 20),
    //             // FormPhoneField<PhoneNumber>(
    //             //   formControlName: _K.phoneNumber,
    //             //   label: 'Phone Number',
    //             //   placeholder: 'Phone Number',
    //             //   prefixIcon: Icons.phone_outlined,
    //             // ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  
  }
}
