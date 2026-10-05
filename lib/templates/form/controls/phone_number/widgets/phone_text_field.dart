import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    required this.initialValue,
    required this.country,
    required this.focusNode,
    this.placeholder,
    this.onChanged,
    this.onTapOutside,
    super.key,
  });

  final String? initialValue;
  final CountryWithPhoneCode country;
  final String? placeholder;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final VoidCallback? onTapOutside;

  TextEditingController? get _controller {
    if (initialValue == null) return null;

    final formatted = formatNumberSync(
      initialValue!,
      country: country,
      inputContainsCountryCode: false,
    );
    return TextEditingController()
      ..value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      style: context.bodyLarge.copyWith(fontSize: 16),
      focusNode: focusNode,
      inputFormatters: [LibPhonenumberTextFormatter(country: country)],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        filled: false,
        hintText: placeholder,
      ),
      onChanged: onChanged,
      onTapOutside: (_) {
        focusNode.unfocus();
        onTapOutside?.call();
      },
    );
  }
}
