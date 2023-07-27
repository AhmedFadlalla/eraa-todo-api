
abstract class HomeState {}

class HomeInitial extends HomeState {}
class GetDashboardDataLoadingState extends HomeState {}
class GetDashboardDataSuccessState extends HomeState {}
class GetDashboardDataErrorState extends HomeState {
  final String error;

  GetDashboardDataErrorState({required this.error});
}

class GetAllTasksDataLoadingState extends HomeState {}
class GetAllTasksDataSuccessState extends HomeState {}
class GetAllTasksDataErrorState extends HomeState {
  final String error;

  GetAllTasksDataErrorState({required this.error});
}
