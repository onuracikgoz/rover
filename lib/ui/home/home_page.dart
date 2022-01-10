import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rover/core/config/app_config.dart';
import 'package:rover/core/enum/custom_text_size.dart';
import 'package:rover/core/widget/custom_text.dart';
import 'package:rover/core/widget/icon_widget.dart';
import 'package:rover/core/widget/no_data_screen.dart';
import 'package:rover/data/cubit/filter/filter_cubit.dart';
import 'package:rover/data/cubit/root/bottom_bar_navigate_cubit.dart';
import 'package:rover/data/cubit/view/view_cubit.dart';
import 'package:rover/data/model/res_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ViewCubit>(context).getViews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BlocBuilder<ViewCubit, ViewState>(builder: (context, state) {
            if (state is ViewDone) {
              return _viewList(context, state);
            } else if (state is ViewInitial) {
              return NoData(
                  text:
                      'No picture found to display.\nPlease change the filter');
            } else {
              return Center(child: CupertinoActivityIndicator());
            }
          }),
        ],
      ),
    );
  }

  Widget _viewList(BuildContext context, ViewDone state) {
    return Expanded(
      child: NotificationListener(
        onNotification: (t) {
          if (t is ScrollEndNotification) {
            if (_scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
              context.read<FilterCubit>().state.reqView.page =
                  context.read<FilterCubit>().state.reqView.page! + 1;

              context.read<ViewCubit>().getViews();
            }
          }

          return true;
        },
        child: MasonryGridView.count(
          controller: _scrollController,
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(10.w),
          itemCount: state.viewList.length,
          itemBuilder: (context, index) {
            return _ViewInfoItem(
              view: state.viewList[index],
            );
          },
        ),
      ),
    );
  }
}

class _ViewInfoItem extends StatelessWidget {
  final View view;
  const _ViewInfoItem({
    Key? key,
    required this.view,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 3),
        ],
        color: AppConfig.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: view.imgSrc,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomText(
              text: view.camera.fullName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomText(
              text: view.earthDate,
              textSize: CustomTextSize.headline6,
            ),
          )
        ],
      ),
    );
  }
}
