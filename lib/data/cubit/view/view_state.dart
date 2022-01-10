part of 'view_cubit.dart';

abstract class ViewState {}

class ViewInitial extends ViewState {}

class ViewPending extends ViewState {}

class ViewDone extends ViewState {
  ViewDone(this.viewList);
   List<View> viewList;
}
