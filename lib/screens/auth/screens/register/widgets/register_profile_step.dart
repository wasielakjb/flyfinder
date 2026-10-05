import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:flyfinder/templates/form/controls/form_text_field.dart';
import 'package:flyfinder/templates/form/controls/phone_number/form_phone_number_field.dart';
import 'package:flyfinder/templates/form/controls/profile_image/form_profile_image_picker.dart';
import 'package:flyfinder/templates/form/layout/form_sliver_gap.dart';

typedef _K = RegisterKeys;

class RegisterProfileStep extends StatelessWidget {
  const RegisterProfileStep({super.key});

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
                  'Set up your profile',
                  style: context.headlineLarge,
                ),
                Text(
                  'Add a few details. Your information is always kept safe.',
                  style: context.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        const FormSliverGap(32),
        FormProfileImagePicker<String>(
          formControlName: _K.image,
        ),
        const FormSliverGap(),
        FormTextField<String>(
          formControlName: _K.fullName, 
          label: 'Full Name',
          placeholder: 'Enter full name',
          keyboardType: TextInputType.name,
        ),
        const FormSliverGap(),
        FormPhoneNumberField<String>(
          formControlName: _K.phoneNumber,
          label: 'Phone Number',
          placeholder: 'Enter phone number',
        ),
      ],
    );
  }
}
