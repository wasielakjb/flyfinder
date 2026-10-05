import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/form/controls/phone_number/widgets/phone_number_field.dart';
import 'package:flyfinder/templates/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef ValidationMsgMap = Map<String, ValidationMessageFunction>;

class FormPhoneNumberField<T> extends StatelessWidget {
  FormPhoneNumberField({
    required this.formControlName,
    required this.label,
    this.placeholder,
    this.validationMessages,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String label;
  final String? placeholder;
  final ValidationMsgMap? validationMessages;
  final bool wrapToSliver;

  Widget _sliverToBoxAdapter({required Widget child}) {
    if (!wrapToSliver) return child;
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
            padding: const EdgeInsets.only(bottom: 8, left: 16),
            child: Text(label, style: context.labelLarge),
          ),
          Skeleton.unite(
            child: ReactiveFormField<T, String>(
              formControlName: formControlName,
              validationMessages: validationMessages,
              builder: (field) => PhoneNumberField(
                initialValue: field.value,
                placeholder: placeholder,
                errorText: field.errorText,
                onChanged: field.didChange,
                onTapOutside: field.control.markAsTouched,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
