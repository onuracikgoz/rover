import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rover/data/model/req_view_model.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState(ReqView(page: 1, sol: 1000)));

  void setCamera(String camera) {
    final currentState;
    state.reqView.camera = camera;
    currentState = state.reqView;
    emit(FilterState(currentState));
  }

  void setSol(int sol) {
    final currentState;
    state.reqView.sol = sol;
    currentState = state.reqView;
    emit(FilterState(currentState));
  }

  void clearFilter() {
    final currentState;
    state.reqView.sol = 1000;
    state.reqView.camera = null;
    state.reqView.page =1;

    currentState = state.reqView;
    emit(FilterState(currentState));
  }
}
