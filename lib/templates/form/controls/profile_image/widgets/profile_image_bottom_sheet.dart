import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/sheet_header.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageBottomSheet extends StatelessWidget {
  const ProfileImageBottomSheet({super.key});

  static Future<String?> open(BuildContext c) async {
    final source = await showModalBottomSheet<ImageSource?>(
      context: c,
      showDragHandle: true,
      useSafeArea: true,
      builder: (context) => const ProfileImageBottomSheet(),
    );
    if (source == null) return null;
    return (await ImagePicker().pickImage(source: source))?.path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SheetHeader(title: 'Select image'),
          const SizedBox(height: 20),
          ProfileImageListItem(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onTap: () => context.pop(ImageSource.camera),
            title: 'Take a photo',
            icon: Icons.photo_camera_outlined,
          ),
          const SizedBox(height: 8),
          ProfileImageListItem(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            onTap: () => context.pop(ImageSource.gallery),
            title: 'Upload from photos',
            icon: Icons.photo_library_outlined,
          ),
        ],
      ),
    );
  }
}

class ProfileImageListItem extends StatelessWidget {
  const ProfileImageListItem({
    required this.onTap,
    required this.title,
    required this.icon,
    this.padding,
    super.key,
  });

  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsetsGeometry.zero,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              spacing: 16,
              children: [
                Icon(icon),
                Text(title, style: context.bodyLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
