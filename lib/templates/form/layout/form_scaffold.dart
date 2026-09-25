import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/form/layout/form_sliver_gap.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormScaffold extends StatelessWidget {
  const FormScaffold({
    required this.formGroup,
    required this.slivers,
    required this.appBarTitle,
    this.appBarSubtitle,
    super.key,
  });

  final FormGroup formGroup;
  final List<Widget> slivers;
  final String appBarTitle;
  final String? appBarSubtitle;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: formGroup,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) => FlexibleSpaceBar(
                    title: constraints.maxHeight <= kToolbarHeight + 90
                        ? Text(appBarTitle)
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              spacing: 12,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: .end,
                              children: [
                                Text(appBarTitle, style: context.headlineSmall),
                                Text(appBarSubtitle!, style: context.bodySmall),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              const FormSliverGap(32),
              ...slivers,
            ],
          ),
        ),
      ),
    );
  }
}
