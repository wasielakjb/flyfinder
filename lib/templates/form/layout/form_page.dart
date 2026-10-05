import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormPage extends StatelessWidget {
  const FormPage({
    required this.formGroup,
    required this.isInitialized,
    required this.slivers,
    this.bottomBar,
    super.key,
  });

  final FormGroup formGroup;
  final bool isInitialized;
  final List<Widget> slivers;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: !isInitialized,
      effect: ShimmerEffect(
        baseColor: context.surfaceContainerHigh,
        highlightColor: context.surfaceContainerHighest,
      ),
      child: ReactiveForm(
        canPop: (formGroup) => formGroup.pristine,
        onPopInvokedWithResult: (formGroup, didPop, result) {},
        formGroup: formGroup,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: context.surface,
                scrolledUnderElevation: 0,
                elevation: 0,
                leadingWidth: 64,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Skeleton.keep(child: BackButton()),
                ),
              ),
              ...slivers,
            ],
          ),
          bottomNavigationBar: SafeArea(
            top: false,
            child: bottomBar ?? const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
