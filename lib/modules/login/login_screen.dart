import 'package:flutter/material.dart';
import 'package:to_do_app/layout/home_layout.dart';

enum data{
  userName,
  Email,
  gender,
}

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isMale = true;
  late String name_;
  data dName = data.userName;
  data dEmail = data.Email;
  data dGender = data.gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
                child: TextFormField(

                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (name){
                   // dName=name;
                    print(name);
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.drive_file_rename_outline,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (email){
                    print(email);
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 150,
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(image: AssetImage('assets/images/male.png'),
                                      height: 60,
                                      width: 60,),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text('MALE',style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isMale ? Colors.blue: Colors.grey[400] ,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isMale = false;
                                    });
                                  },
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(image: AssetImage('assets/images/female.png'),
                                          height: 60,
                                          width: 60,),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text('FEMALE',style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: isMale ? Colors.grey[400] : Colors.blue ,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(onPressed: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeLayout()));
                    });
                  },
                  child: Text('Register',style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )
                  ),

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
