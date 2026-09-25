import 'package:bloc/bloc.dart';
import 'package:flyfinder/screens/auth/screens/register/form_builders/register_fg_factory.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial()) {
    init();
  }

  FormGroup? _formGroup;
  FormGroup get formGroup => _formGroup ?? FormGroup({});

  void init() {
    _formGroup = RegisterFormGroupFactory.create();
  }
}
