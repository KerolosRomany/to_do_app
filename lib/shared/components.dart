import 'package:flutter/material.dart';
import 'package:to_do_app/shared/cubit/cubit.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  // Function? onSubmit,
  //  required Function? validate,
  // required Function()? validate,

  required Function validate,
  required Function onTap,
  required String label_text,
  required IconData prefix_icon,
  bool? isClickable = true,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  enabled: isClickable,
  // onFieldSubmitted: onSubmit!(),
  validator:  (s){
    return validate(s);
  },
  decoration: InputDecoration(
    labelText: label_text,
    border: OutlineInputBorder(),
    prefixIcon: Icon(
      prefix_icon,
    ),
  ),
  onTap: (){
    onTap();
  },
);

Widget buildTaskItem(Map model,context){
  return Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0,top: 15.0,bottom: 15.0,right: 5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xff004D40),
            child: Text(
                '${model['time']}',
              style: TextStyle(
                color: Colors.white,
               ),

            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:FontWeight.bold,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text('${model['date']}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            color: Color(0xff004D40),
              onPressed: (){
                AppCubit.get(context).updateData(status: 'done',
                    id: model['id']);
              },
              icon: Icon(Icons.check_box)),
          IconButton(
            color: Color(0xff004D40),
              onPressed: (){
                AppCubit.get(context).updateData(status: 'archived',
                    id: model['id']);
              },
              icon: Icon(Icons.archive_outlined)),
        ],



      ),
    ),
    onDismissed: (direction){
      AppCubit.get(context).deleteData(id: model['id']);
    },
  );
}
