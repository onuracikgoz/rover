import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:rover/data/cubit/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  signInWithFacebook() async {
    try {
      emit(AuthPending());

      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        final loginResult = await FacebookAuth.instance.login();

        if (loginResult.status == LoginStatus.success) {
          final token = loginResult.accessToken!.token;

          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(token);

          UserCredential user = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);
        }
      }
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError());
      rethrow;
    }
  }

  setAuthState(AuthState state) {
    emit(state);
  }

  
}
