import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/templates/form/controls/form_text_field.dart';
import 'package:flyfinder/templates/form/controls/profile_image/widgets/profile_image_bottom_sheet.dart';
import 'package:flyfinder/templates/form/layout/form_error_text.dart';
import 'package:flyfinder/templates/sliver_wrapper.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormProfileImagePicker<T> extends StatelessWidget {
  FormProfileImagePicker({
    required this.formControlName,
    this.validationMessages,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
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
      child: Skeleton.unite(
        child: ReactiveFormField<T, String>(
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (field) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipOval(
                    child: Material(
                      shape: CircleBorder(
                        side: BorderSide(
                          width: 1.2,
                          color: field.errorText != null
                              ? context.error
                              : context.outlineVariant,
                        ),
                      ),
                      color: context.surfaceContainer,
                      child: InkWell(
                        onTap: () async {
                          final res = await ProfileImageBottomSheet.open(
                            context,
                          );
                          if (res == null) return;
                          field.didChange(res);
                        },
                        borderRadius: BorderRadius.circular(99),
                        child: SizedBox(
                          height: 128,
                          width: 128,
                          child: field.value == null
                              ? Icon(
                                  Icons.person_outline,
                                  size: 64,
                                  color: context.outlineVariant,
                                )
                              : Image.file(
                                  File(field.value!),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.primary,
                      ),
                      child: Icon(
                        Icons.edit_rounded,
                        color: context.surface,
                      ),
                    ),
                  ),
                ],
              ),
              if (field.errorText != null) FormErrorText(field.errorText!),
            ],
          ),
        ),
      ),
    );
  }
}
