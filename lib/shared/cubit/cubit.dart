
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/shared/cubit/states.dart';

import '../../modules/archieved/archieved_screen.dart';
import '../../modules/done/done_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';
import '../constants.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneScreen(),
    ArchievedScreen(),
  ];

  List<String> titles = [
    'New tasks',
    'Done tasks',
    'Archived tasks',
  ];

  void changeIndex (int index){
    currentIndex = index;
    emit(AppChangeNavBarState());
  }

  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void createDataBase() {
    openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version) async {
          print('database created');
          await database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,date TEXT, time TEXT, status TEXT)'
          );
          print('Table created');
        },
        onOpen: (database){
          getDateFromDatabase(database);
          print('database opened');
        }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }
  insertToDataBase({required String title, required String time, required String date}) async
  {
    return await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")')
          .then((value) {
        print('$value Inserted successfully');
        emit(AppInsertDatabaseState());

        getDateFromDatabase(database);
      }).catchError((error){
        print('Error when inserting new record ${error.toString()}');
      });
      return Future(() => null);
    }
    );

  }
  void getDateFromDatabase(database)
  {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];
    emit(AppGetDatbaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element) {
        if (element['status'] == 'new'){
          newTasks.add(element);
        }
        else if (element['status'] == 'done'){
          doneTasks.add(element);
        }
        else
          archivedTasks.add(element);
      });
      emit(AppGetFromDatbaseState());
    });


  }
  void updateData({
    required String status,
    required int id,
  })
  {
    database.rawUpdate(
      'Update tasks SET status = ? WHERE id = ?',
        ['$status','$id']
    ).then((value) {
      getDateFromDatabase(database);
      emit(AppUpdateDatabaseState());
    }) ;

  }

  void deleteData({
    required int id,
  })
  {
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id],
    ).then((value) {
      getDateFromDatabase(database);
      emit(AppDeleteDatabaseState());
    }) ;

  }

  bool isBottomSheetShow = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({required bool isShow,required IconData icon}){
    isBottomSheetShow=isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());

  }


}