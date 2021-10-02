part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
  final bool isAuthenticated;

  AuthInitial({
    this.isAuthenticated = false
  });  
}
