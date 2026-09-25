import 'package:reactive_forms/reactive_forms.dart';

extension AbstractControlX<T> on AbstractControl<T> {
  void patchValueNoticeably(T? value) {
    patchValue(value);
    markAsDirty();
    markAsTouched();
  }

  void resetNoticeably() {
    patchValueNoticeably(null);
  }
}
