import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rover/core/config/app_config.dart';

import 'custom_text.dart';
import 'icon_widget.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.h,),
            CustomIconWidget(iconPath: IconConstant.instance.logo,height: 100.w,width: 100.w,),
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              textAlign: TextAlign.center,
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
