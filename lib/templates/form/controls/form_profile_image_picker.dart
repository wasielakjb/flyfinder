import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/form/layout/form_error_text.dart';
import 'package:flyfinder/templates/sliver_wrapper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormProfileImagePicker<T> extends StatelessWidget {
  FormProfileImagePicker({
    required this.formControlName,
    this.wrapToSliver = true,
  }) : super(key: ValueKey(formControlName));

  final String formControlName;
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
      child: ReactiveFormField<T, File>(
        formControlName: formControlName,
        builder: (field) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: field.errorText != null
                          ? context.error
                          : context.outlineVariant,
                    ),
                  ),
                  child: ClipOval(
                    child: Material(
                      color: context.surfaceContainer,
                      borderRadius: BorderRadius.circular(99),
                      child: InkWell(
                        onTap: () async {
                          final res = await ImagePickerBottomSheet.open(context);
                          if (res == null) return;
                          field.didChange(res);
                        },
                        borderRadius: BorderRadius.circular(99),
                        child: field.value != null
                            ? Image.file(
                                field.value!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.person_outline_rounded,
                                color: context.outlineVariant,
                                size: 64,
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
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            if (field.errorText != null) FormErrorText(field.errorText!),
          ],
        ),
      ),
    );
  }
}

class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({super.key});

  static Future<File?> open(BuildContext c) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: c,
      useSafeArea: true,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      builder: (_) => const ImagePickerBottomSheet(),
    );
    if (source == null) return null;

    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return null;
    return File(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () => context.pop(ImageSource.camera),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14),
              ),
              tileColor: context.surfaceContainer,
              title: const Text('Take a photo'),
              titleTextStyle: context.titleSmall,
              leading: const Icon(Icons.photo_camera_outlined),
            ),
            const SizedBox(height: 8),
            ListTile(
              onTap: () => context.pop(ImageSource.gallery),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14),
              ),
              tileColor: context.surfaceContainer,
              title: const Text('Upload from photos'),
              titleTextStyle: context.titleSmall,
              leading: const Icon(Icons.photo_library_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
