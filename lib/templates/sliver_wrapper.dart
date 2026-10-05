import 'package:flutter/material.dart';

class SliverWrapper extends StatelessWidget {
  const SliverWrapper({
    required this.padding,
    required this.child,
    super.key,
  });

  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
