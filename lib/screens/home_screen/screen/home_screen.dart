import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasks_app/core/util/app_functions/app_functions.dart';
import 'package:tasks_app/screens/add_tasks_screen/add_task_screen.dart';
import 'package:tasks_app/screens/home_screen/cubit/home_cubit.dart';
import 'package:tasks_app/screens/home_screen/cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          AppFunctions.navigateTo(
              context: context, navigatedWidget: AddTaskScreen());
        },
        child: Icon(Icons.add),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=HomeCubit.get(context);
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConditionalBuilder(
                      condition: cubit.dashboardData!=null,
                      builder: (context)=>Center(
                        child: CircularPercentIndicator(
                          radius: 90.0,
                          lineWidth: 9.0,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: cubit.dashboardData!.completeTasks/cubit.dashboardData!.allTasks,
                          footer: Text(
                            "${((cubit.dashboardData!.completeTasks/cubit.dashboardData!.allTasks)*100).toInt()}%",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          animation: true,
                          animationDuration: 2000,
                          center: CircularPercentIndicator(
                            radius: 70.0,
                            lineWidth: 9.0,
                            circularStrokeCap: CircularStrokeCap.square,
                            animation: true,
                            header: Text("", style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            )),
                            footer: Text(
                              "${((cubit.dashboardData!.inProgressTasks/cubit.dashboardData!.allTasks)*100).toInt()}%",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                            animationDuration: 2000,
                            percent: cubit.dashboardData!.inProgressTasks/cubit.dashboardData!.allTasks,
                            center: CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 9.0,
                              circularStrokeCap: CircularStrokeCap.round,
                              animation: true,
                              header: Text("", style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )),
                              footer: Text(
                                "${((cubit.dashboardData!.newTasks/cubit.dashboardData!.allTasks)*100).toInt()}%",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              animationDuration: 2000,
                              center: Text(
                                "${cubit.dashboardData!.allTasks}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white
                                ),
                              ),
                              percent: cubit.dashboardData!.newTasks/cubit.dashboardData!.allTasks,
                              progressColor: Colors.redAccent,
                            ),
                            progressColor: const Color(0xff000ffb),
                          ),
                          progressColor: Colors.amber,
                        ),
                      ),
                      fallback: (context)=>CircularProgressIndicator()),
                  SizedBox(height: 8,),
                  Text("All Tasks", style: TextStyle(
                      fontSize: 14,
                      color: Colors.amber,

                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                 ConditionalBuilder(
                     condition: cubit.allTasksModel!=null,
                     builder: (context)=> GridView.count(
                   crossAxisCount: 2,
                   shrinkWrap: true,
                   crossAxisSpacing: 4,
                   mainAxisSpacing: 4,
                   childAspectRatio: 19 / 14,
                   physics: BouncingScrollPhysics(),
                   children: List.generate(cubit.allTasksModel!.response!.length,
                           (index) =>
                       Container(

                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(25),
                             border: Border.all(color: Colors.amber)
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             children: [
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment
                                       .start,
                                   children: [
                                     Text(cubit.allTasksModel!.response![index].title!, style: TextStyle(
                                         fontSize: 22,
                                         color: Colors.white
                                     ),),
                                     SizedBox(height: 4,),
                                     Text(cubit.allTasksModel!.response![index].startDate!, style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.grey
                                     ),),
                                     SizedBox(height: 4,),
                                     Text(cubit.allTasksModel!.response![index].endDate!, style: TextStyle(
                                         fontSize: 18,
                                         color: Colors.grey
                                     ),),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       )),),
                     fallback: (context)=>CircularProgressIndicator())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
