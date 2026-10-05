part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState._({
    required this.status,
    required this.initialized,
  });

  factory LoginState.inital() {
    return LoginState._(
      status: InitialLoginStatus(),
      initialized: false,
    );
  }

  final LoginStatus status;
  final bool initialized;

  LoginState copyWith({
    LoginStatus? status,
    bool? initialized,
  }) {
    return LoginState._(
      status: status ?? this.status,
      initialized: initialized ?? this.initialized,
    );
  }

  bool get pending => status is PendingLoginStatus;

  @override
  List<Object?> get props => [
    status,
    initialized,
  ];
}

sealed class LoginStatus extends Equatable {
  const LoginStatus();

  @override
  List<Object?> get props => [];
}

class InitialLoginStatus extends LoginStatus {}

class PendingLoginStatus extends LoginStatus {}

class SuccessLoginStatus extends LoginStatus {}

class ErrorLoginStatus extends LoginStatus {
  const ErrorLoginStatus({
    required this.exception,
  });

  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
