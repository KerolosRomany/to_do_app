import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/modules/add_task/add_task_screen.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  bool checkBoxValue=false;
  List<Widget> screens = [

  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(onPressed: (){},
       icon: Icon(Icons.format_align_left),color: Colors.black),
      backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
          print(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline,),
          label: 'Tasks',
          ),
          BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.add),onPressed: (){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen(currentIndex)));
            });
          }),
          label: 'Add',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings,),
          label: 'Settings',
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    children: [
                      Container(
                        width: 290,
                        child: Text('Today',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),),
                      ),
                      CircleAvatar(
                          child: IconButton(
                            onPressed: (){
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen(currentIndex)));
                              });
                            },
                            icon: Icon(Icons.add),
                            color: Colors.white,
                          ),
                        backgroundColor: Colors.orange,
                      ),  //here you can add a task

                    ],
                  ),
              ),
              Row(
                  children: [
                    Checkbox(value: checkBoxValue, onChanged:(bool? value){
                      setState(() {
                        checkBoxValue=value!;
                      });
                    },
                      checkColor: Colors.white70,
                      activeColor: Colors.orange,
                    ),
                    Container(
                      width: 220,
                        child: Text(
                          'Wake up',
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                    ),
                    Text('06:00 AM',style: TextStyle(
                        fontSize: 20
                    ),)
                  ],
                ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'GYM',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('06:30 AM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Feed dog',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('08:00 AM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Go to supermarket',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('05:00 PM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Visit my friend',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('07:30 PM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 290,
                      child: Text('Tomorrow',style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen(currentIndex)));
                          });
                        },
                        icon: Icon(Icons.add),
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.orange,
                    ),  //here you can add a task

                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Wake up',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('06:00 AM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'GYM',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('06:30 AM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Feed dog',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('08:00 AM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Go to supermarket',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('05:00 PM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),
              Row(
                children: [
                  Checkbox(value: checkBoxValue, onChanged:(bool? value){
                    setState(() {
                      checkBoxValue=value!;
                    });
                  },
                    checkColor: Colors.white70,
                    activeColor: Colors.orange,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      'Visit my friend',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Text('07:30 PM',style: TextStyle(
                      fontSize: 20
                  ),)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


  Future<String> getName() async
  {
    return 'Kerolos Romany';
  }
}
