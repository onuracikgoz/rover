import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rover/core/config/app_config.dart';
import 'package:rover/core/enum/custom_text_size.dart';
import 'package:rover/core/widget/icon_widget.dart';
import 'package:rover/core/service/navigator_service.dart';
import 'package:rover/core/widget/custom_flat_button.dart';
import 'package:rover/core/widget/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rover/data/cubit/auth/auth_cubit.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[_header(), _footer(context)],
    ))));
  }

  Column _footer(BuildContext context) {
    return Column(
      children: [
        CustomFlatButton(
          iconUrl: IconConstant.instance.facebook,
          text: 'Continue with Facebook',
          isBoldText: false,
          iconColor: AppConfig.primaryColor,
          onPressed: () {
            context.read<AuthCubit>().signInWithFacebook();
            // _navigationService.navigateTo('/login');
          },
          color: Color(0xff39579A),
          width: 300.w,
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 280.w,
          child: const CustomText(
            textSize: CustomTextSize.bodyText1,
            text: '©2021 Parasut. Tüm Hakları Saklıdır.',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 280.w,
          child: const CustomText(
            textSize: CustomTextSize.bodyText1,
            text: 'Developed By Parasut',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }

  Widget _header() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconWidget(
          iconPath: IconConstant.instance.logo,
          width: 150.w,
          height: 150.w,
        ),
        SizedBox(height: 40.h),
        const CustomText(
          text: "MARS",
          textSize: CustomTextSize.headline1,
          isBold: false,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 200.w,
          height: 50.h,
          child: const CustomText(
            text: 'Eyes of rovers',
            textSize: CustomTextSize.headline3,
            textAlign: TextAlign.center,
            isBold: false,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
