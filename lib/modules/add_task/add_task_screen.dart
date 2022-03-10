import 'package:flutter/material.dart';
import 'package:to_do_app/layout/home_layout.dart';

class AddTaskScreen extends StatefulWidget {
  int currentIndex = 1;
  AddTaskScreen(int currentIndex){
    this.currentIndex=currentIndex;
  }

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
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
        currentIndex: 1,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index){
          setState(() {
            if (index==0)
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLayout()));
              });
          });
          print(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline,),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.add),onPressed: (){
            setState(() {

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 290,
                    child: Text('Add new task',style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),),
                  ),
                  //here you can add a task

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: Text('Task Name',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),),
              ),
              TextFormField(
                decoration: InputDecoration(
                  helperText: 'Example : Wake up',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: Text('Time',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      TimeOfDay? newTime = await showTimePicker(context: context, initialTime: selectedTime,);
                      if (newTime==null) return;
                      setState(() {
                        selectedTime=newTime;
                      });
                      },
                    child: Text('Change Time'),
                  ),
                  SizedBox(width: 100,),
                  Text("${selectedTime.hour}:${selectedTime.minute}",style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text('Notes',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),),
              ),
              TextFormField(
                decoration: InputDecoration(
                  helperText: 'Tap here to add new nodes',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Attachments',style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),),
              ),
              TextFormField(
                decoration: InputDecoration(
                  helperText: 'Tap here to add Files',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 30,
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLayout()));
                        });
                      },
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      iconSize: 35,
                    ),
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
