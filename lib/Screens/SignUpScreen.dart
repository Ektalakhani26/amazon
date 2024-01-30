// ignore_for_file: unrelated_type_equality_checks, unnecessary_this

import 'package:flutter/material.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool ishidden=true;
  var name;
  var password;
  var Fname = TextEditingController();
  var _Lname = TextEditingController();
  var _Email = TextEditingController();
  var _Number = TextEditingController();
  var Password1 = TextEditingController();
  var _reset = TextEditingController();

  var Error = null;
  var Error1 = null;
  var Error2 = null;
  var Error3 = null;
  var Error4 = null;
  final FormKey = GlobalKey<FormState>();

  List<Form1> formlist = [];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: FormKey,
            child: Container(
              height: size.height,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Amz6.jpg'),fit: BoxFit.cover)),

              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text('Sign Up',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 30),),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'F Name',
                        label: Text('Enter First Name'),
                        border: OutlineInputBorder(),
                        errorText: Error,
                      ),
                      controller: Fname,
                      validator: (value) {
                        RegExp re3=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');
                        var pas=value;
                        if (pas == null || pas.isEmpty) {
                          return 'Please enter some text';
                        }
                        else if(!re3.hasMatch(pas)){
                          return 'enter uppercase and lowercase';
                        }
                        return null;},
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        label: Text('Email'),
                        border: OutlineInputBorder(),
                        errorText: Error2,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _Email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        else if(RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                          return null;
                        } else
                        {
                          return 'enter valid email';
                        }
                        return null;
                      },

                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Number',
                        label: Text('Number'),
                        border: OutlineInputBorder(),
                        errorText: Error3,
                      ),
                      keyboardType: TextInputType.number,
                      controller: _Number,
                      validator: (value) {
                        RegExp re1=RegExp(r'^(?=.*?[0-9])');
                        var mno=value;
                        if (mno == null || mno.isEmpty) {
                          return 'Please enter some text';
                        }
                        else if(mno.length != 10){
                          return 'please enter 10 digit';
                        }
                        else if(!re1.hasMatch(mno)){
                          return 'must contain number';
                        }
                        return null;
                      },

                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(

                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: _topassword,
                          child: Icon(ishidden ? Icons.visibility_off : Icons.visibility ,color: Colors.blue,),
                        ),
                        hintText: 'Password',
                        label: Text('Password'),
                        border: OutlineInputBorder(),
                        errorText: Error4,
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: ishidden,
                      controller: Password1,
                      validator: (value) {
                        Password1 == AutofillHints.password;
                        RegExp re=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!#?$*@~]).{8,}$');
                        var ps=value;
                        if (ps == null || ps!.isEmpty) {
                          return 'Please enter some text';
                        }
                        else if(ps.length<7){
                          return 'password must be more than 5 charater';
                        }
                        else if(!re.hasMatch(ps)){
                          return 'password must contain upper,lower,special,digit';
                        }
                        return null;
                      },

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _reset,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Reset password'),
                        hintText: 'password',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        else if(value != Password1.text){
                          return 'not same';
                        }
                        return null;
                      },

                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print('name=${Fname.text}');
                        print('password=${Password1.text}');
                        Form1(this.Fname.text == LogInScreen, this.Password1.text == LogInScreen);
                        // Validate returns true if the form is valid, or false otherwise.
                        Form1(Fname, Password1);
                        if (FormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),

                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen.Mydata(username1: Fname.text,PAS1: Password1.text),));
                        }
                      },
                      child:  Text('Submit'),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _topassword() {
    setState(() {
      ishidden = !ishidden;
    });
  }
}

class Form1 {
  var usnm;
  var password;

  Form1(this.usnm,this.password);

}


