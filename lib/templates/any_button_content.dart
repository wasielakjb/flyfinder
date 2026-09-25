import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';

class AnyButtonContent extends StatelessWidget {
  const AnyButtonContent({
    this.text,
    this.style,
    this.loading = false,
    this.fullWidth = false,
    this.icon,
    super.key,
  });

  final String? text;
  final TextStyle? style;
  final bool loading;
  final bool fullWidth;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: loading ? 0 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: icon,
                ),
              if (text != null) Text(text!, style: style),
            ],
          ),
        ),
        if (loading)
          Positioned.fill(
            child: Align(
              child: SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  color: context.surface,
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
