import 'package:rover/core/config/app_config.dart';
import 'package:rover/core/service/navigator_service.dart';

import 'package:another_flushbar/flushbar.dart';

class Snack {
  static showSnackBar({required String message}) {
    

    Flushbar(
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(milliseconds: 3000),
      backgroundColor: AppConfig.secondaryColor,
    ).show(NavigationService.navigatorKey.currentState!.context);
  }
}
