import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/util/app_functions/app_functions.dart';
import 'package:tasks_app/screens/home_screen/cubit/home_cubit.dart';
import 'package:tasks_app/screens/home_screen/cubit/home_state.dart';

import '../../core/util/widgets/form_field_component.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=HomeCubit.get(context);
          return SafeArea(
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      cubit.getImage();
                    },
                    child: CircleAvatar(
                      radius: 56,
                      backgroundImage: cubit.imageFile!=null?Image.file(cubit.imageFile!).image:Image.network("https://as2.ftcdn.net/v2/jpg/03/01/74/15/1000_F_301741517_3bvFxpxY3I74BrSFJT86Cqzz6p8cEBJ7.jpg").image,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormFieldComponent(
                    controller: cubit.titleController,
                    label: "Title",
                    labelColor: Colors.amber,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field must not be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormFieldComponent(
                    controller: cubit.descriptionController,
                    label: "Description",
                    labelColor: Colors.amber,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field must not be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormFieldComponent(
                    controller: cubit.startDateController,
                    labelColor: Colors.amber,

                    label: "Start Date",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field must not be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.none,
                    onTap: () async {
                      final value=await AppFunctions.showDatePickerComponent(context: context);
                      if(value !=''){
                        cubit.startDateController.text=value;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormFieldComponent(
                    controller: cubit.endDateController,
                    label: "End Date",
                    labelColor: Colors.amber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field must not be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.none,
                    onTap: () async {
                      final value=await AppFunctions.showDatePickerComponent(context: context);
                      if(value !=''){
                        cubit.endDateController.text=value;
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
