import 'package:flyfinder/screens/auth/screens/login/form_builders/login_form_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef _K = LoginKeys;

abstract class LoginFormGroupFactory {
  static FormGroup create() {
    return FormGroup({
      _K.login: FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      _K.password: FormControl<String>(
        validators: [Validators.required],
      ),
    });
  }
}
