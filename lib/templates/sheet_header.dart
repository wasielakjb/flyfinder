import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({
    required this.title,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.titleLarge),
              if (subtitle != null) Text(subtitle!, style: context.bodyLarge),
            ],
          ),
          IconButton(
            onPressed: context.maybePop,
            icon: const Icon(Icons.close_outlined),
          ),
        ],
      ),
    );
  }
}
