import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit(String? initialValue) : super(PhoneNumberState.initial()) {
    final countries = CountryManager().countries.sortedBy(
      (e) => e.countryName ?? '',
    );
    emit(state.copyWith(countries: countries));

    if (initialValue?.isNotEmpty ?? false) {
      final number = getNumber(initialValue!);
      final country = CountryWithPhoneCode.getCountryDataByPhone(initialValue);
      emit(state.copyWith(number: number, country: country));
    } else {
      final country = countryFromLocale();
      emit(state.copyWith(country: country));
    }
  }

  String getNumber(String value) {
    final country = CountryWithPhoneCode.getCountryDataByPhone(value)!;
    final lastPrefixIndex = 1 + country.phoneCode.length;
    return value.substring(lastPrefixIndex);
  }

  CountryWithPhoneCode countryFromLocale() {
    final localeCode = Platform.localeName.split('_')[1];
    return state.countries.singleWhere((e) => e.countryCode == localeCode);
  }

  String formatNumberForCountry(CountryWithPhoneCode value) {
    final number = value.exampleNumberMobileInternational.replaceAll(' ', '');
    final numberLength = getNumber(number).length;
    final currentNumber = state.number.replaceAll(' ', '');
    if (currentNumber.length > numberLength) {
      return currentNumber.substring(0, numberLength);
    }
    return currentNumber;
  }

  void changeCountry(CountryWithPhoneCode value) {
    emit(state.copyWith(country: value, number: formatNumberForCountry(value)));
  }

  void changeNumber(String value) {
    emit(state.copyWith(number: value));
  }
}
