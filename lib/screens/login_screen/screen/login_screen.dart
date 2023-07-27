import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/services/cach_helper.dart';
import 'package:tasks_app/core/util/app_functions/app_functions.dart';
import 'package:tasks_app/screens/login_screen/cubit/login_cubit.dart';
import 'package:tasks_app/screens/login_screen/cubit/login_state.dart';
import 'package:tasks_app/screens/register_screen/screen/register_screen.dart';

import '../../../core/util/app_color.dart';
import '../../../core/util/shared_key.dart';
import '../../../core/util/widgets/default_bottom_widget.dart';
import '../../home_screen/screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          var cubit=LoginCubit.get(context);
          if(state is UserLoginSuccessState){
            CachHelper.saveData(key: SharedKeys.token, value:state.token).then((value) {
              AppFunctions.navigateAndFinishTo(
                  context: context, navigatedWidget: HomeScreen());
            });
          }
        },
        builder: (context, state) {
          var cubit=LoginCubit.get(context);
          return SingleChildScrollView(
            child: Form(
              key:cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 120,),
                    SizedBox(height: 18,),
                    Text(
                      'Login to your account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    Text(
                      'Lets Login to Manage your tasks',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
                    ),
                    SizedBox(height: 18,),
                    //emailController
                    TextFormField(
                        controller: cubit.emailController,
                        style: const TextStyle(
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintStyle: const TextStyle(
                                color: Colors.black
                            ),
                            labelStyle: const TextStyle(
                                color: Colors.black
                            ),
                            prefixIcon: const Icon(
                              Icons.email,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: mainColor,

                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: mainColor,

                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,

                                )
                            )
                        )

                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //passwordController
                    TextFormField(
                        controller:cubit.passwordController,
                        style: const TextStyle(
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintStyle: const TextStyle(
                                color: Colors.black
                            ),
                            labelStyle: const TextStyle(
                                color: Colors.black
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: mainColor,

                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: mainColor,

                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,

                                )
                            )
                        )

                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(height: 18,),
                    ConditionalBuilder(
                        condition: state is UserLoginLoadingState ,
                        builder: (context)=>CircularProgressIndicator(),
                        fallback: (context)=>DefaultBottomWidget(function: () {

                          if(cubit.formKey.currentState!.validate()){

                            cubit.userLogin();
                            // navigateTo(context,  HomeScreen());
                          }
                        }, text: 'Login')),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don\'t have an account?"),
                        TextButton(onPressed: () {
                          AppFunctions.navigateTo(context: context,
                              navigatedWidget: RegisterScreen());
                        }, child: Text('Register'))
                      ],
                    )


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
