import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/core/util/end_points/end_points.dart';
import 'package:tasks_app/screens/login_screen/cubit/login_state.dart';

import '../../../core/services/dio_helper.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);
  var formKey=GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  Future<void> userLogin()async{
    emit(UserLoginLoadingState());
    final response=await DioHelper.postData(url: EndPoints.login,
    data: {
      "email":emailController.text,
      "password":passwordController.text
    });

    if(response.statusCode==200){
      emit(UserLoginSuccessState(token: response.data['authorisation']["token"]));
    }else{
    emit(UserLoginErrorState(error: response.data['message']));
    }
  }
  
}
