import 'package:bloc/bloc.dart';

part 'bottom_bar_navigate_state.dart';

class BottomNavigationCubit extends Cubit<NavigationState> {
  BottomNavigationCubit() : super(NavigationState(0));

  void getNavBarItem(int index) {

     

    emit(NavigationState(index));
  }
}
