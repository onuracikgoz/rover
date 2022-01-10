import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rover/core/config/app_config.dart';
import 'package:rover/core/const/camera_type.dart';
import 'package:rover/core/enum/custom_text_size.dart';
import 'package:rover/core/service/navigator_service.dart';
import 'package:rover/core/service/snack_bar_service.dart';
import 'package:rover/core/widget/custom_flat_button.dart';
import 'package:rover/core/widget/custom_text.dart';
import 'package:rover/core/widget/custom_text_field.dart';
import 'package:rover/data/cubit/filter/filter_cubit.dart';
import 'package:rover/data/cubit/root/bottom_bar_navigate_cubit.dart';
import 'package:rover/data/cubit/view/view_cubit.dart';
import 'package:rover/data/model/filter_camera_model.dart';

class FilterPage extends StatelessWidget {
  FilterPage({Key? key}) : super(key: key);
  NavigationService _navigationService = NavigationService();
  TextEditingController _solController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _solController.text =
        context.read<FilterCubit>().state.reqView.sol.toString();
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const CustomText(
              text: "Choose camera",
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return _FilterCameraWidget(
                        cameraType: ConstValues.cameraTypes[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                        child: Divider(
                      color: Colors.grey,
                    ));
                  },
                  itemCount: ConstValues.cameraTypes.length),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              controller: _solController,
              hintText: "Sol",
              onChanged: (value) {
                if (value!.isNotEmpty) {
                  context.read<FilterCubit>().setSol(int.tryParse(value)!);
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomFlatButton(
              text: 'Filter',
              onPressed: () {
                if (_solController.text.isEmpty) {
                  Snack.showSnackBar(message: "sol number cannot be empty");
                } else if (int.tryParse(_solController.text)! < 3500) {
                  _navigationService.pop();
                  context.read<ViewCubit>().getViews();
                } else {
                  Snack.showSnackBar(
                      message: "sol number cannot be greater than 3500");
                }
              },
              color: AppConfig.secondaryColor,
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: CustomText(
        text: 'Filter',
        textSize: CustomTextSize.headline6,
      ),
      actions: [
        InkWell(
            onTap: () {
              context.read<FilterCubit>().clearFilter();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.refresh,
                size: 30.w,
              ),
            ))
      ],
    );
  }
}

class _FilterCameraWidget extends StatelessWidget {
  const _FilterCameraWidget({Key? key, required this.cameraType})
      : super(key: key);

  final CameraType cameraType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(builder: (context, state) {
      return InkWell(
        onTap: () {
          if (context.read<BottomNavigationCubit>().state.index == 0 &&
                  cameraType.curiosity ||
              context.read<BottomNavigationCubit>().state.index == 1 &&
                  cameraType.opportunity ||
              context.read<BottomNavigationCubit>().state.index == 2 &&
                  cameraType.spirit) {
            context.read<FilterCubit>().setCamera(cameraType.abbreviation);
          } else {
            Snack.showSnackBar(
                message:
                    "This rover does not have this camera, please choose another camera");
          }
        },
        child: Container(
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(text: cameraType.abbreviation),
                SizedBox(
                  height: 5,
                ),
                CustomText(text: cameraType.camera),
              ]),
              if (state.reqView.camera == cameraType.abbreviation)
                Icon(Icons.check)
            ],
          ),
        ),
      );
    });
  }
}
