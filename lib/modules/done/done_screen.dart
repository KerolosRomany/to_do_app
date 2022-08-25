import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) {},
      builder: (context,state) {
        var tasks = AppCubit.get(context).doneTasks;
        return tasks.length> 0 ?
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
        );
      },
    );
  }
}
