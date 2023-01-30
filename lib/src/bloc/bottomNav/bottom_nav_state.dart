part of 'bottom_nav_cubit.dart';

abstract class BottomNavState {}

class BottomNavInitial extends BottomNavState {}
class UpdateIndex extends BottomNavState {
  late int index;
  UpdateIndex(this.index);
}
class GetHome extends BottomNavState {
  late int index;
  GetHome(this.index);
}
class GetTasks extends BottomNavState {
  late int index;
  GetTasks(this.index);
}
class GetApps extends BottomNavState {
  late int index;
  GetApps(this.index);
}
class GetNotification extends BottomNavState {
  late int index;
  GetNotification(this.index);
}
class GetProfile extends BottomNavState {
  late int index;
  GetProfile(this.index);
}
