import 'package:flutter/material.dart';

class FormSliverGap extends StatelessWidget {
  const FormSliverGap([this.gap = 24, Key? key]) : super(key: key);

  final double gap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: gap,
      ),
    );
  }
}
