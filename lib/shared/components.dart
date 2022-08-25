import 'package:flutter/material.dart';

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

Widget buildTaskItem(){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Text(
              '02:00 PM'
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task Title',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:FontWeight.bold,
                )),
            Text('2 April 2022',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                )),
          ],
        )
      ],



    ),
  );
}
