import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/form/controls/phone_number/phone_prefix_bottom_sheet.dart';
import 'package:flyfinder/templates/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef ValidationMsgMap = Map<String, ValidationMessageFunction>;

class FormPhoneNumberField extends StatefulWidget {
  FormPhoneNumberField({
    required this.formControlName,
    required this.label,
    this.placeholder,
    this.prefixIcon,
    this.validationMessages,
    this.inputFormatters = const [],
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String label;
  final String? placeholder;
  final IconData? prefixIcon;
  final ValidationMsgMap? validationMessages;
  final List<TextInputFormatter> inputFormatters;

  final bool wrapToSliver;

  @override
  State<FormPhoneNumberField> createState() => _FormPhoneNumberFieldState();
}

class _FormPhoneNumberFieldState extends State<FormPhoneNumberField> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  Widget _sliverToBoxAdapter({required Widget child}) {
    if (!widget.wrapToSliver) return child;
    return SliverWrapper(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _sliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(widget.label, style: context.labelLarge),
          ),
          ReactiveFormField<String, String>(
            formControlName: widget.formControlName,
            validationMessages: widget.validationMessages,
            builder: (field) => InputDecorator(
              isFocused: _focusNode.hasFocus,
              isEmpty: field.value == null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                errorMaxLines: 2,
                errorText: field.errorText,
                prefixIcon: widget.prefixIcon != null
                    ? Icon(widget.prefixIcon, size: 20)
                    : null,
              ),
              child: Row(
                spacing: 2,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(8),
                    color: context.surfaceContainer,
                    child: InkWell(
                      onTap: () async {
                        final res = await PhonePrefixBottomSheet.open(context);
                        if (res == null) return;
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('+45', style: context.bodyLarge,),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(right: 14),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        border: InputBorder.none,
                        filled: false,
                        hintText: widget.placeholder,
                      ),
                      focusNode: _focusNode,
                      onChanged: field.didChange,
                      onTapOutside: (_) {
                        _focusNode.unfocus();
                        field.control.markAsTouched();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
