import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class FormErrorText extends StatelessWidget {
  const FormErrorText(
    this.text, {
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    super.key,
  });

  final String text;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DefaultTextStyle(
        style: context.labelMedium.copyWith(color: context.error),
        child: Text(text),
      ),
    );
  }
}
