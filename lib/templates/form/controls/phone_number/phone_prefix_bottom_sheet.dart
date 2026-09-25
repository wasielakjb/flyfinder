import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PhonePrefixBottomSheet extends StatefulWidget {
  const PhonePrefixBottomSheet({super.key});

  static Future<CountryWithPhoneCode?> open(BuildContext c) async {
    return showModalBottomSheet<CountryWithPhoneCode>(
      context: c,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      builder: (_) => const PhonePrefixBottomSheet(),
    );
  }

  @override
  State<PhonePrefixBottomSheet> createState() => _PhonePrefixBottomSheetState();
}

class _PhonePrefixBottomSheetState extends State<PhonePrefixBottomSheet> {
  final CountryManager countryManager = CountryManager();
  List<CountryWithPhoneCode> get countries =>
      countryManager.countries.sortedBy((e) => e.countryName ?? '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: ScrollablePositionedList.separated(
          itemCount: countries.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = countries[index];
            return ListTile(
              onTap: () => context.maybePop(item),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14),
              ),
              tileColor: context.surfaceContainer,
              title: Text('+${item.phoneCode}'),
              titleTextStyle: context.titleSmall,
              subtitle: Text(item.countryName ?? item.countryCode),
              subtitleTextStyle: context.bodyMedium,
            );
          },
          separatorBuilder: (_, _) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
