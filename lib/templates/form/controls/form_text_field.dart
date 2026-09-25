import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flyfinder/extensions/reactive_form_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef ValidationMsgMap = Map<String, ValidationMessageFunction>;

class FormTextField<T> extends StatefulWidget {
  FormTextField({
    required this.formControlName,
    required this.label,
    this.placeholder,
    this.prefixIcon,
    this.validationMessages,
    this.inputFormatters = const [],
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final String label;
  final String? placeholder;
  final IconData? prefixIcon;
  final ValidationMsgMap? validationMessages;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final bool wrapToSliver;

  @override
  State<FormTextField<T>> createState() => _FormTextFieldState<T>();
}

class _FormTextFieldState<T> extends State<FormTextField<T>> {
  bool _hidePassword = true;

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
          ReactiveTextField<T>(
            formControlName: widget.formControlName,
            validationMessages: widget.validationMessages,
            inputFormatters: widget.inputFormatters,
            obscureText: widget.obscureText && _hidePassword,
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: widget.placeholder,
              errorMaxLines: 2,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, size: 20)
                  : null,
              suffixIcon: ReactiveValueListenableBuilder<T>(
                formControlName: widget.formControlName,
                builder: (context, control, _) {
                  final hasValue = control.value is String
                      ? (control.value! as String).isNotEmpty
                      : control.value != null;
                  final isPasswordField =
                      widget.keyboardType == TextInputType.visiblePassword;

                  if (isPasswordField || widget.obscureText) {
                    return IconButton(
                      onPressed: () => setState(() {
                        _hidePassword = !_hidePassword;
                      }),
                      icon: Icon(
                        _hidePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 18,
                      ),
                    );
                  }
                  if (!hasValue) return const SizedBox.shrink();
                  return IconButton(
                    onPressed: control.resetNoticeably,
                    icon: const Icon(Icons.close_rounded, size: 18),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
