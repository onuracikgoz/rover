import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rover/data/cubit/filter/filter_cubit.dart';
import 'package:rover/data/cubit/root/bottom_bar_navigate_cubit.dart';
import 'package:rover/data/model/req_view_model.dart';
import 'package:rover/data/model/res_view_model.dart';
import 'package:rover/data/services/view_services.dart';

part 'view_state.dart';

class ViewCubit extends Cubit<ViewState> {
  final ViewService viewService;
  final FilterCubit filterCubit;
  final BottomNavigationCubit bottomNavigationCubit;

  ViewCubit(this.viewService, this.filterCubit, this.bottomNavigationCubit)
      : super(ViewInitial());

  void getViews() {
    String ship;

    if (bottomNavigationCubit.state.index == 0) {
      ship = "Curiosity";
    } else if (bottomNavigationCubit.state.index == 0) {
      ship = "Opportunity";
    } else {
      ship = "Spirit";
    }

    if (filterCubit.state.reqView.page! == 1) {
      emit(ViewPending());
    }
    viewService
        .getView(ship: ship, parameters: filterCubit.state.reqView)
        .then((value) {
      if (filterCubit.state.reqView.page! > 1 )  {
        var tempList = (state as ViewDone).viewList;

        tempList.addAll(value);

        emit(ViewDone(tempList));
        if(value.isEmpty){
        filterCubit.state.reqView.page =  filterCubit.state.reqView.page! - 1 ; }

      } else {
        if (value.isNotEmpty) {
          emit(ViewDone(value));
        } else {
          emit(ViewInitial());
        }
      }
    });
  }
}
