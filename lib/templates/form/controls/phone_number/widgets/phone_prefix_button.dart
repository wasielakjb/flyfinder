import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class PhonePrefixButton extends StatelessWidget {
  const PhonePrefixButton({
    required this.initialValue,
    required this.onTap,
    super.key,
  });

  final CountryWithPhoneCode initialValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.surfaceContainer,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            '+${initialValue.phoneCode}',
            style: context.bodyLarge.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
