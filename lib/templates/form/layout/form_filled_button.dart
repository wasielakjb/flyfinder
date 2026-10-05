import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormFilledButton extends StatelessWidget {
  const FormFilledButton({
    required this.onPressed,
    required this.text,
    this.padding,
    this.isPending = false,
    super.key,
  });

  final EdgeInsetsGeometry? padding;
  final bool isPending;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverToBoxAdapter(
        child: ReactiveFormConsumer(
          builder: (context, formGroup, _) => FilledButton(
            onPressed: onPressed,
            child: isPending && formGroup.valid
                ? SizedBox.fromSize(
                    size: const Size(18, 18),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: context.surface,
                    ),
                  )
                : Text(text),
          ),
        ),
      ),
    );
  }
}
