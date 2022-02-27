import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<int> {
  BottomNavBarCubit() : super(0);
  void getDashboard() => emit(0);
  void getTasks() => emit(1);
  void getNotification() => emit(2);
  void getProfile() => emit(3);
}
