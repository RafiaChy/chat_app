part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginScreenAnimate extends LoginEvent{}
class LoginViaGoogle extends LoginEvent{}