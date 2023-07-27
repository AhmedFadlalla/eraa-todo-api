import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/core/services/dio_helper.dart';
import 'package:tasks_app/screens/register_screen/cubit/register_state.dart';

import '../../../core/util/end_points/end_points.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  var formKey=GlobalKey<FormState>();

  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  Future<void> userRegister()async{
    emit(UserRegisterLoadingState());

    final response=await DioHelper.postData(
        url: EndPoints.register,
      data: {
          "name":nameController.text,
          "email":emailController.text,
          "password":passwordController.text,
      }
    );

    if(response.statusCode==200){
      emit(UserRegisterSuccessState());
    }else if(response.statusCode==201){
      emit(UserRegisterSuccessWithExceptionState(message: response.data['message']));
    }
    else{
      emit(UserRegisterErrorState(error: response.data['message']));
    }

  }

  void clearAllData(){

   passwordController.text='';
    emailController.text='';
    nameController.text='';
  }

}
