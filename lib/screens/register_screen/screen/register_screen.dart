import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/screens/login_screen/screen/login_screen.dart';
import 'package:tasks_app/screens/register_screen/cubit/register_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../../core/util/app_functions/app_functions.dart';
import '../../../core/util/widgets/default_bottom_widget.dart';
import '../../../core/util/widgets/form_field_component.dart';
import '../cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          var cubit=RegisterCubit.get(context);
          if(state is UserRegisterSuccessState){
            cubit.clearAllData();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit=RegisterCubit.get(context);
          return SingleChildScrollView(
            child: Center(
              child: Form(
                key: cubit.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 35,),
                      Text(
                        'Create your account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      SizedBox(height: 18,),
                      //nameController
                      FormFieldComponent(
                          controller: cubit.nameController,

                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name must not be empty';
                            }
                          },
                          label: 'Name',
                          prefixIcon: Icons.person),
                      SizedBox(height: 18,),
                      FormFieldComponent(
                          controller:cubit.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Email address must not be empty';
                            }
                            return null;
                          },
                          label: "Email",
                          prefixIcon: Icons.email_outlined),
                      SizedBox(height: 14,),
                      FormFieldComponent(
                          controller: cubit.passwordController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Password must not be empty';
                            }
                            return null;
                          },
                          label: "Password",
                          prefixIcon: Icons.lock),
                      SizedBox(height: 18,),
                      ConditionalBuilder(
                          condition: state is! UserRegisterLoadingState,
                          builder: (context)=>DefaultBottomWidget(
                              function: () {
                                if(cubit.formKey.currentState!.validate()){
                                  cubit.userRegister();
                                }
                              },
                              text: 'Sign Up'),
                          fallback: (context)=>Center(
                            child: CircularProgressIndicator.adaptive(

                            ),
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(onPressed: () {
                            AppFunctions.navigateTo(
                                context: context,
                                navigatedWidget: LoginScreen());
                          }, child: Text('Login'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
