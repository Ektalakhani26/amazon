

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/Txt.dart';
import '../Pages/HomeScreen.dart';
import 'SignUpScreen.dart';
import 'SplashScreen.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key?key}) : super(key: key);

  var username1;
  var PAS1;

  @override
  State<LogInScreen> createState() => _LogInScreenState(username1,PAS1);

  LogInScreen.Mydata({required this.username1, required this.PAS1});


}

class _LogInScreenState extends State<LogInScreen> {
  // File? _image;
  // final _picker = ImagePicker();


  var username1;
  var PAS1;

  _LogInScreenState(this.username1, this.PAS1);

  var value1 = false;
  var _LogInScreenKey =  GlobalKey <FormState> ();
  var nm;
  var pas;
  var err=null;
  var err1=null;
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: _LogInScreenKey,
              child: Container(
                height: size.height,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Amz6.jpg'),fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(height: 90),
                    //Text('LOGIN Page ',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w600),),
                    Txt('LOGIN Page ',color: Colors.black,fontSize: 30,fontWeight: FontWeight.w600),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: ' Name',
                            label: Text('Enter Name'),
                            border: OutlineInputBorder(),
                            errorText: err
                        ),
                        controller: username,
                        // focusNode: FocusNode(),
                        validator: (value) {
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Password',
                            label: Text('Enter Password'),
                            border: OutlineInputBorder(),
                            errorText: err1
                        ),
                        controller: password,
                      ),
                    ),


                    Row(
                      children: [
                        Checkbox(
                          value: value1,
                          onChanged: (value) {
                            value1=value!;
                            setState(() {
                            });
                          },
                        ),
                        Text('Accept Terms & Conditions'),
                        SizedBox(width: 100),


                      ],
                    ),


                    SizedBox(height: 30),
                    ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                      onPressed: () async {


                        if(_LogInScreenKey.currentState!.validate()){
                          if(username1 == username.text && PAS1 == password.text){
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setBool(SplashScreenState.KEYLOGIN, true);
                            setState(() {

                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                          }
                        }
                      }, child: Text('Login',style: TextStyle(color: Colors.white)),

                    ),
                    SizedBox(height: 50),

                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Text("If you don't have account",style: TextStyle(color: Colors.black),),
                        Txt("If you don't have account",color: Colors.black),
                        SizedBox(width: 5),
                        TextButton(
                            onPressed: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                            }, child: Text('Sign Up')),
                      ],
                    ),

                  ],
                ),
              )),
        ),
      ),

    );
  }

}



