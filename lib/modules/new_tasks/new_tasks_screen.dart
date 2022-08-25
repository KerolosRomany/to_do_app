import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/shared/components.dart';
import 'package:to_do_app/shared/cubit/cubit.dart';
import 'package:to_do_app/shared/cubit/states.dart';

import '../../shared/constants.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) {},
      builder: (context,state) {
        var tasks = AppCubit.get(context).newTasks;
        return Scaffold(

          body: tasks.length> 0 ?
          ListView.separated(
              itemBuilder:(context, index) => buildTaskItem(tasks[index],context),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
              itemCount: tasks.length) :
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu,size: 50,color: Color(0xff004D40),),
                Text('No tasks yet, Please add some tasks',style: TextStyle(
                  fontSize: 17,
                  color: Color(0xff004D40),
                ),)
              ],
            ),
          ),
        );


          
      },
    );
  }
}
