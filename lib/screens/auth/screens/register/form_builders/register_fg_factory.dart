import 'dart:io';

import 'package:flyfinder/screens/auth/screens/register/form_builders/register_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = RegisterKeys;

abstract class RegisterFormGroupFactory {
  static FormGroup create() {
    return FormGroup({
      _K.login: FormControl<String>(
        validators: [Validators.required],
      ),
      _K.password: FormControl<String>(
        validators: [Validators.required],
      ),
      _K.fullName: FormControl<String>(
        validators: [Validators.required],
      ),
      _K.phoneNumber: FormControl<String>(
        validators: [Validators.required],
      ),
      _K.dateOfBirth: FormControl<DateTime>(
        validators: [Validators.required],
      ),
      _K.image: FormControl<File>(
        validators: [Validators.required],
      ),
      _K.hasAcceptedTerms: FormControl<bool>(
        value: false,
        validators: [Validators.required],
      ),
    });
  }
}
