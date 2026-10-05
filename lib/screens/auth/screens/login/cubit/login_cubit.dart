import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flyfinder/screens/auth/screens/login/form_builders/login_fg_factory.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.inital()) {
    init();
  }

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  void init() {
    _formGroup = LoginFormGroupFactory.create();
    assert(_formGroup != null, 'Form has not been initialized!');
    emit(state.copyWith(initialized: true));
  }

  Future<void> submit() async {
    formGroup.markAllAsTouched();
    emit(state.copyWith(status: PendingLoginStatus()));
  }
}
