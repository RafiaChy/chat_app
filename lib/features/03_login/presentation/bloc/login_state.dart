part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{
  @override

  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginBringAnimation extends LoginState {}
class LoginSuccess extends LoginState{
  final String message;
  LoginSuccess({required this.message});
  @override

  List<Object?> get props => [message];
}
class LoginFail extends LoginState{
  final String message;
   LoginFail({required this.message});
  @override

  List<Object?> get props => [message];
}
