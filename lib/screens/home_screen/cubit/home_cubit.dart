
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasks_app/core/services/dio_helper.dart';
import 'package:tasks_app/core/util/end_points/end_points.dart';
import 'package:tasks_app/main.dart';
import 'package:tasks_app/screens/home_screen/models/dash_board_model.dart';

import '../models/task_model.dart';
import 'home_state.dart';



class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  
  static HomeCubit get(context)=>BlocProvider.of(context);

var formKey=GlobalKey<FormState>();

var titleController=TextEditingController();
var descriptionController=TextEditingController();
var startDateController=TextEditingController();
var endDateController=TextEditingController();

DashboardModel? dashboardData;
Future<void> getDashboardData()async{
  emit(GetDashboardDataLoadingState());
  final response=await DioHelper.getData(
      url: EndPoints.dashboard,
  token: token);

  if(response.statusCode==200){
    dashboardData=DashboardModel.fromJson(response.data["0"]);
    emit(GetDashboardDataSuccessState());
  }else{
    print("errorrr:${response.data['message']}");
    emit(GetDashboardDataErrorState(error: response.data['message']));
  }
  
}

  AllTasksModel? allTasksModel;
Future<void> getAllTasks()async{
  emit(GetAllTasksDataLoadingState());
  final response=await DioHelper.getData(
      url: EndPoints.allTasks,
      token: token);

  if(response.statusCode==200){
    allTasksModel=AllTasksModel.fromJson(response.data);
    emit(GetAllTasksDataSuccessState());
  }else{
    print("errorrr:${response.data['message']}");
    emit(GetAllTasksDataErrorState(error: response.data['message']));
  }
}

ImagePicker imagePicker=ImagePicker();
File? imageFile;
Future<void> getImage()async{
  final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

  if(file!=null){
    imageFile=File(file.path);
  }else{

  }
}



}
