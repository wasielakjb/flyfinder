import 'package:flutter/material.dart';
import 'package:flyfinder/templates/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormCheckbox extends StatelessWidget {
  FormCheckbox({
    required this.formControlName,
    this.wrapToSliver = true,
    this.child,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
  final bool wrapToSliver;
  final Widget? child;

  Widget _sliverToBoxAdapter({required Widget child}) {
    if (!wrapToSliver) return child;
    return SliverWrapper(
      padding: const EdgeInsets.only(left: 28),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _sliverToBoxAdapter(
      child: Skeleton.replace(
        replacement: const Padding(
          padding: EdgeInsetsGeometry.only(left: 8),
          child: Bone.text(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ReactiveCheckbox(
              formControlName: formControlName,
              splashRadius: 0,
            ),
            ?child,
          ],
        ),
      ),
    );
  }
}
