abstract class AuthState {}

class AuthPending extends AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {}



class Logout extends AuthState {}
