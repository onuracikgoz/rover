import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rover/core/service/generate_route.dart';
import 'package:rover/core/service/http_service.dart';
import 'package:rover/core/service/navigator_service.dart';
import 'package:rover/core/theme/theme.dart';
import 'package:rover/data/cubit/auth/auth_cubit.dart';
import 'package:rover/data/cubit/filter/filter_cubit.dart';
import 'package:rover/data/cubit/root/bottom_bar_navigate_cubit.dart';
import 'package:rover/data/cubit/view/view_cubit.dart';
import 'package:rover/data/model/res_view_model.dart';
import 'package:rover/data/services/view_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpService _httpService = HttpService();
    final AuthCubit _authCubit = AuthCubit();
    final FilterCubit _filterCubit = FilterCubit();
    final ViewService _viewService = ViewService(_httpService);
    final BottomNavigationCubit _bottomNavigationCubit =
        BottomNavigationCubit();
    final ViewCubit _viewCubit =
        ViewCubit(_viewService, _filterCubit, _bottomNavigationCubit);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MultiBlocProvider(
                providers: [
                  BlocProvider<AuthCubit>(
                    create: (BuildContext context) => _authCubit,
                  ),
                  BlocProvider<BottomNavigationCubit>(
                    create: (BuildContext context) => _bottomNavigationCubit,
                  ),
                  BlocProvider<ViewCubit>(
                    create: (BuildContext context) => _viewCubit,
                  ),
                  BlocProvider<FilterCubit>(
                    create: (BuildContext context) => _filterCubit,
                  ),
                ],
                child: MaterialApp(
                  navigatorKey: NavigationService.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  title: 'Rover',
                  theme: AppTheme.getThemeFromThemeMode(),
                  onGenerateRoute: RouteGenerator.generateRoute,
                  initialRoute: "/",
                )));
  }
}
