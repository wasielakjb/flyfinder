import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flyfinder/templates/form/controls/phone_number/cubit/phone_number_cubit.dart';
import 'package:flyfinder/templates/form/controls/phone_number/widgets/phone_prefix_bottom_sheet.dart';
import 'package:flyfinder/templates/form/controls/phone_number/widgets/phone_prefix_button.dart';
import 'package:flyfinder/templates/form/controls/phone_number/widgets/phone_text_field.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({
    required this.initialValue,
    required this.errorText,
    required this.onChanged,
    this.placeholder,
    this.onTapOutside,
    super.key,
  });

  final String? initialValue;
  final String? placeholder;
  final String? errorText;
  final void Function(String?) onChanged;
  final VoidCallback? onTapOutside;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhoneNumberCubit(widget.initialValue),
      child: BlocConsumer<PhoneNumberCubit, PhoneNumberState>(
        listener: (context, state) => widget.onChanged.call(state.fullNumber),
        listenWhen: (previous, _) => previous != PhoneNumberState.initial(),
        builder: (context, state) {
          final cubit = context.read<PhoneNumberCubit>();
          return InputDecorator(
            isEmpty: widget.initialValue == null,
            isFocused: _focusNode.hasFocus,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 4, right: 16),
              errorText: widget.errorText,
              errorMaxLines: 2,
            ),
            child: Row(
              spacing: 4,
              children: [
                PhonePrefixButton(
                  initialValue: state.country,
                  onTap: () async {
                    final res = await PhonePrefixBottomSheet.open(
                      context,
                      cubit: cubit,
                    );
                    if (res == null) return;
                    cubit.changeCountry(res);
                  },
                ),
                Expanded(
                  child: PhoneTextField(
                    initialValue: state.number,
                    country: state.country,
                    placeholder: widget.placeholder,
                    focusNode: _focusNode,
                    onChanged: cubit.changeNumber,
                    onTapOutside: widget.onTapOutside,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
