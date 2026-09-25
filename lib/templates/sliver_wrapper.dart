import 'package:flutter/material.dart';

class SliverWrapper extends StatelessWidget {
  const SliverWrapper({
    required this.padding,
    required this.child,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: margin,
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
