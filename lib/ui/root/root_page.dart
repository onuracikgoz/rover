import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rover/core/config/app_config.dart';
import 'package:rover/core/enum/custom_text_size.dart';
import 'package:rover/core/service/navigator_service.dart';
import 'package:rover/core/widget/custom_text.dart';
import 'package:rover/core/widget/icon_widget.dart';
import 'package:rover/data/cubit/auth/auth_cubit.dart';
import 'package:rover/data/cubit/auth/auth_state.dart';
import 'package:rover/data/cubit/filter/filter_cubit.dart';
import 'package:rover/data/cubit/root/bottom_bar_navigate_cubit.dart';
import 'package:rover/data/cubit/view/view_cubit.dart';
import 'package:rover/ui/filter/filter_page.dart';
import 'package:rover/ui/home/home_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    NavigationService _navigationService = NavigationService();
    User _user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 70.h),
            child: _appBar(_user, _navigationService),
          ),
          bottomNavigationBar: _bottomNavigationBar(),
          body: HomePage()),
    );
  }

  Widget _bottomNavigationBar() {
    return BlocBuilder<BottomNavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.w),
                  topRight: Radius.circular(25.w)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                backgroundColor: AppConfig.primaryColor,
                currentIndex: state.index,
                items: [
                  BottomNavigationBarItem(
                    icon: CustomIconWidget(
                      iconPath: IconConstant.instance.ship_1,
                    ),
                    label: 'Curiosity',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomIconWidget(
                      iconPath: IconConstant.instance.ship_2,
                    ),
                    label: 'Opportunity',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomIconWidget(
                      iconPath: IconConstant.instance.ship_3,
                    ),
                    label: 'Spirit',
                  ),
                ],
                onTap: (index) {
                  BlocProvider.of<BottomNavigationCubit>(context)
                      .getNavBarItem(index);

                  BlocProvider.of<FilterCubit>(context).clearFilter();

                  BlocProvider.of<ViewCubit>(context).getViews();
                },
              ),
            ));
      },
    );
  }

  Widget _appBar(User _user, NavigationService _navigationService) {
    return BlocBuilder<BottomNavigationCubit, NavigationState>(
        builder: (context, state) {
      return AppBar(
        leadingWidth: 200.w,
        leading: _profileWidget(user: _user),
        centerTitle: true,
        elevation: 4,
        actions: [
          InkWell(
            onTap: () {
              _navigationService.navigateTo('/filter');
            },
            child: Icon(
              Icons.filter_alt_outlined,
              size: 30.w,
            ),
          )
        ],
        title: CustomText(
          text: (state as NavigationState).index == 0
              ? "Curiosity"
              : (state as NavigationState).index == 1
                  ? "Opportunity"
                  : "Spirit",
          textSize: CustomTextSize.headline1,
        ),
      );
    });
  }
}

class _profileWidget extends StatelessWidget {
  const _profileWidget({
    Key? key,
    required User user,
  })  : _user = user,
        super(key: key);

  final User _user;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: _user.photoURL ??
              "https://w7.pngwing.com/pngs/223/244/png-transparent-computer-icons-avatar-user-profile-avatar-heroes-rectangle-black.png",
          width: 50.w,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: _user.displayName!.split(' ')[0],
            ),
            InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  BlocProvider.of<AuthCubit>(context).setAuthState(Logout());
                },
                child: Icon(Icons.logout))
          ],
        )
      ],
    );
  }
}
