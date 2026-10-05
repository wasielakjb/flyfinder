enum RegisterSteps {
  account(1),
  profile(2);

  const RegisterSteps(this.value);

  final int value;

  int toInt() => value;

  static RegisterSteps fromInt(int value) => RegisterSteps.values.firstWhere(
    (element) => element.value == value,
  );
}
