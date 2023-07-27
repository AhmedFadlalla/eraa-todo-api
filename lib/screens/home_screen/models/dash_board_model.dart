class DashboardModel {

  final int inProgressTasks;
  final int completeTasks;
  final int newTasks;
  final int allTasks;

  DashboardModel(
      {
        required this.inProgressTasks,
      required  this.completeTasks,
      required  this.newTasks,
       required this.allTasks});

 factory  DashboardModel.fromJson(Map<String,dynamic> json)=>DashboardModel(
      inProgressTasks: json["in progress tasks"],
      completeTasks: json["completed tasks"],
      newTasks: json['new tasks'],
      allTasks: json['all tasks']);
}