part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginFailure extends AuthState {
  final String erroeMessage;
  LoginFailure({required this.erroeMessage}); 
}

final class SignupLoading extends AuthState {}
final class SignupSuccess extends AuthState {}
final class SignupFailure extends AuthState {
  final String erroeMessage;
 SignupFailure({required this.erroeMessage}); 
}

final class ForgetPasswordLoading extends AuthState {}
final class ForgetPasswordSuccess extends AuthState {}
final class ForgetPasswordFailure extends AuthState {
  final String erroeMessage;
  ForgetPasswordFailure({required this.erroeMessage}); 
}
