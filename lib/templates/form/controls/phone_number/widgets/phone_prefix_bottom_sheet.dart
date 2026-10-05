import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flyfinder/extensions/color_scheme_getters_extension.dart';
import 'package:flyfinder/extensions/text_style_getters_extension.dart';
import 'package:flyfinder/templates/form/controls/phone_number/cubit/phone_number_cubit.dart';
import 'package:flyfinder/templates/sheet_header.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PhonePrefixBottomSheet extends StatefulWidget {
  const PhonePrefixBottomSheet({super.key});

  static Future<CountryWithPhoneCode?> open(
    BuildContext c, {
    required PhoneNumberCubit cubit,
  }) async {
    return showModalBottomSheet<CountryWithPhoneCode>(
      context: c,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const PhonePrefixBottomSheet(),
      ),
    );
  }

  @override
  State<PhonePrefixBottomSheet> createState() => _PhonePrefixBottomSheetState();
}

class _PhonePrefixBottomSheetState extends State<PhonePrefixBottomSheet> {
  final SearchController controller = SearchController();
  List<CountryWithPhoneCode> countries = CountryManager().countries;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneNumberCubit, PhoneNumberState>(
      builder: (context, state) => SafeArea(
        child: Column(
          spacing: 20,
          children: [
            const SheetHeader(title: 'Phone number prefix'),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, _) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBar(
                  controller: controller,
                  scrollPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.search_outlined,
                    color: context.outlineVariant,
                  ),
                  trailing: [
                    if (value.text.trim().isNotEmpty)
                      IconButton(
                        onPressed: controller.clear,
                        icon: const Icon(Icons.close_outlined),
                      ),
                  ],
                  hintText: 'Search for countries',
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  onChanged: (value) => setState(() {
                    if (value.isEmpty) {
                      countries = state.countries;
                      return;
                    }
                    countries = state.countries.where(
                      (e) {
                        return (e.countryName ?? '').toLowerCase().contains(
                          value.toLowerCase(),
                        );
                      },
                    ).toList();
                  }),
                ),
              ),
            ),
            Expanded(
              child: ScrollablePositionedList.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                initialScrollIndex: countries.indexOf(state.country),
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final item = countries[index];
                  return PhonePrefixListItem(
                    selected: state.country == item,
                    onTap: context.maybePop,
                    item: item,
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhonePrefixListItem extends StatelessWidget {
  const PhonePrefixListItem({
    required this.selected,
    required this.item,
    required this.onTap,
    super.key,
  });

  final bool selected;
  final CountryWithPhoneCode item;
  final void Function(CountryWithPhoneCode) onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? context.primaryContainer : null,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => onTap.call(item),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Text(
            '${item.countryName} (+${item.phoneCode})',
            style: context.bodyLarge.copyWith(
              color: selected ? context.primary : null,
            ),
          ),
        ),
      ),
    );
  }
}
