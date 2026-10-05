part of 'phone_number_cubit.dart';

class PhoneNumberState extends Equatable {
  const PhoneNumberState({
    required this.country,
    required this.number,
    required this.countries,
  });

  factory PhoneNumberState.initial() {
    return const PhoneNumberState(
      country: CountryWithPhoneCode.gb(),
      number: '',
      countries: [],
    );
  }

  final CountryWithPhoneCode country;
  final String number;
  final List<CountryWithPhoneCode> countries;

  String? get fullNumber =>
      number.isNotEmpty ? '+${country.phoneCode}$number' : null;

  PhoneNumberState copyWith({
    CountryWithPhoneCode? country,
    String? number,
    List<CountryWithPhoneCode>? countries,
  }) {
    return PhoneNumberState(
      country: country ?? this.country,
      number: number ?? this.number,
      countries: countries ?? this.countries,
    );
  }

  @override
  List<Object> get props => [
    country,
    number,
    countries,
  ];
}
