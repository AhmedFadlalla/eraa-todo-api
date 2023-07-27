import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/services/cach_helper.dart';
import 'package:tasks_app/core/services/dio_helper.dart';
import 'package:tasks_app/screens/home_screen/cubit/home_cubit.dart';
import 'package:tasks_app/screens/home_screen/screen/home_screen.dart';
import 'package:tasks_app/screens/login_screen/cubit/login_cubit.dart';
import 'package:tasks_app/screens/login_screen/screen/login_screen.dart';
import 'package:tasks_app/screens/register_screen/cubit/register_cubit.dart';

import 'bloc_observer.dart';
import 'core/util/shared_key.dart';

String? token;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CachHelper.init();
  Bloc.observer = MyBlocObserver();

 // token=CachHelper.getData(key: SharedKeys.token);
  token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Rhc2tzLmVyYWFzb2Z0LmNvbS9hcGkvbG9naW4iLCJpYXQiOjE2OTAwNTQ1MDQsImV4cCI6MTY5MDA1ODEwNCwibmJmIjoxNjkwMDU0NTA0LCJqdGkiOiJHSjBPTnNjcmZFRktWZGoyIiwic3ViIjoiMTEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.FNhBLih2HWZIi8vNKZGva9WoguQ2ZyAp7MrlFaxVLtc";
  Widget? widget;
  if(token!=null){
    widget=HomeScreen();
  }else{
    widget=LoginScreen();
  }
  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key,
  required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => HomeCubit()..getDashboardData()..getAllTasks()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            backgroundColor: Colors.black
          ),
          themeMode: ThemeMode.dark,
          home: startWidget,
        ));
  }
}
