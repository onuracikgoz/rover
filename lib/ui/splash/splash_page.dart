import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rover/core/config/app_config.dart';
import 'package:rover/core/widget/icon_widget.dart';
import 'package:rover/core/service/navigator_service.dart';
import 'package:rover/data/cubit/auth/auth_cubit.dart';
import 'package:rover/data/cubit/auth/auth_state.dart';
import 'package:rover/ui/auth/welcome_page.dart';
import 'package:rover/ui/root/root_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  NavigationService _navigationService = NavigationService();

  User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 2000), () async {
      user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        context.read<AuthCubit>().setAuthState(AuthSuccess());
      } else {
        context.read<AuthCubit>().setAuthState(Logout());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return RootPage();
      } else if (state is Logout) {
        return WelcomePage();
      } else {
        return Scaffold(
          body: Center(
            child: CustomIconWidget(
              iconPath: IconConstant.instance.logo,
              width: 100.w,
              height: 100.w,
            ),
          ),
        );
      }
    });
  }
}
