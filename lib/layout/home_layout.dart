import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/shared/cubit/cubit.dart';

import '../shared/components.dart';
import '../modules/archieved/archieved_screen.dart';
import '../modules/done/done_screen.dart';
import '../modules/new_tasks/new_tasks_screen.dart';
import '../shared/constants.dart';
import '../shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {



  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController =TextEditingController();
  var timeController =TextEditingController();
  var dateController =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state) {
          if (state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder:(context,state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar (
              title: Text(
                  cubit.titles[cubit.currentIndex]
              ),
              centerTitle: true,
              backgroundColor: Color(0xff004D40),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xff004D40),
              onTap: (index){
                // setState(()
                // {
                //   currentIndex = index;
                // }
                // );
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.check_circle_outlined,),
                    label: 'Done'),
                BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label: 'Archieved'),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff004D40),
              onPressed: (){
                if (cubit.isBottomSheetShow){
                  if (formKey.currentState!.validate()){

                    cubit.insertToDataBase(title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                        clearText(titleController);
                        clearText(timeController);
                        clearText(dateController);


                  }
                } else{
                  scaffoldKey.currentState?.showBottomSheet((context)
                  {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.grey[100],
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(
                                    controller: titleController,
                                    type: TextInputType.text,
                                    label_text: 'Title',
                                    onTap: (){
                                      print('Title is adding');
                                    },
                                    prefix_icon: Icons.title,
                                    validate: (String? value)
                                    {
                                      if (value!.isEmpty) {
                                        return 'title must not be empty';
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                    controller: dateController,
                                    type: TextInputType.datetime,
                                    onTap: (){
                                      showDatePicker(context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.parse('2022-12-31')).then((value) {
                                        dateController.text = DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    label_text: 'Date',
                                    prefix_icon: Icons.calendar_today,
                                    validate: (String? value)
                                    {
                                      if (value!.isEmpty) {
                                        return 'Date must not be empty';
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                    controller: timeController,
                                    type: TextInputType.datetime,
                                    onTap: (){
                                      showTimePicker(context: context,
                                          initialTime: TimeOfDay.now())
                                          .then((value) {
                                        timeController.text= value!.format(context).toString();
                                        print(value.format(context));
                                      });
                                    },
                                    label_text: 'Time',
                                    prefix_icon: Icons.watch_later_outlined,
                                    validate: (String? value)
                                    {
                                      if (value!.isEmpty) {
                                        return 'Time must not be empty';
                                      }
                                      return null;
                                    }),



                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).closed.then((value) {
                    cubit.changeBottomSheetState(
                        isShow:false ,
                        icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(
                      isShow:true,
                      icon: Icons.add);

                }
              },
              child: Icon(cubit.fabIcon),
            ),
            body: state is! AppGetDatbaseLoadingState ?
              cubit.screens[cubit.currentIndex] : Center(
                child: CircularProgressIndicator()
            )
          );
        }
      ),
    );
  }

  void clearText(TextEditingController controller) {
    controller.clear();
  }
}
