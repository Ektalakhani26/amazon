
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../DBHelper/DBHelper.dart';
import '../bottombar/BottomNavigationBar.dart';


class YouScreen extends StatefulWidget {
  YouScreen({super.key});

  @override
  State<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends State<YouScreen> {
  List<Map<String, dynamic>> _journals = [];

  void _refreshJournals() async {
    final data = await SQLHelper.getprofileItems();
    setState(() {
      _journals = List<Map<String, dynamic>>.from(data);
      print(_journals);
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();


  File? _image;
  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  Future<void> _addItem() async {
    File imageFile = File(_image!.path);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String imagePath = '${appDocDir.path}/${DateTime.now().millisecondsSinceEpoch}.png';
    await imageFile.copy(imagePath);

    await SQLHelper.profileItem(
      _nameController.text,
      _contactController.text,
      _emailController.text,
      _pincodeController.text,
      _cityController.text,
      _stateController.text,
      imagePath,  // Save the image path instead of _image!.path
    );

    _refreshJournals();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshJournals();

  }
  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _pincodeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();

  }

  final FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(_journals.last['name']);
    // print(_journals.last['contact']);
    if(_journals.isNotEmpty) {
      var a = _journals.length - 1;
      _nameController.text = _journals[a]['name'] ?? '';
      _contactController.text = _journals[a]['contact'] ?? '';
      _emailController.text = _journals[a]['email'] ?? '';
      _pincodeController.text = _journals[a]['pincode'] ?? '';
      _cityController.text = _journals[a]['city'] ?? '';
      _stateController.text = _journals[a]['state'] ?? '';

    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MyFun.bottomNavigation(context),
        body: SingleChildScrollView(
          child: Form(
            key: FormKey,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: size.height/3.5,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bckgrnd1.jpg'),fit: BoxFit.fill)),
                      child: Padding(
                        padding:  EdgeInsets.only(top: 20,left: 10,right: 10),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text('Profile',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 180,
                      left: 140,
                      child: CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: (_image != null)
                            ? FileImage(_image!)
                            : (_journals.isNotEmpty && _journals.last['image'] != null)
                            ? FileImage(File(_journals.last['image']))  // Use the stored image path
                            : AssetImage('assets/images/profile.jpg') as ImageProvider<Object>,
                             ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 230,top:270 ),
                      child: InkWell(
                          onTap: () async {
                            await _openImagePicker();
                            setState(() {
                            });
                          },
                          child: Icon(Icons.camera_alt)),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                Text('${_nameController.text}'),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      //  hintText: _nameController.toString(),
                      labelStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),
                      border: UnderlineInputBorder(),
                    ),
                    validator: (value) {
                     // RegExp re3=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$');
                    if(value==null || value.isEmpty){
                      return 'Enter Name';

                    }
                    return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: _contactController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        //  hintText: _contactController.toString(),
                        labelStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder()
                    ),
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
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email Id*',
                        // hintText: _emailController.text,
                        labelStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {return 'Please enter some text';}
                      else if(RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                        return null;}
                      else {return 'enter valid email';}
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: _pincodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Pin Code',
                        //  hintText: _pincodeController.text,
                        labelStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder()
                    ),
                    validator: (value) {
                      var mno=value;
                      if(mno==null || mno.isEmpty){
                        return 'enter the value';
                      }
                      else if(mno.length != 6){
                        return 'please enter 6 digit';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                        labelText: 'City',
                        // hintText: _cityController.text,
                        labelStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder()
                    ),
                    validator: (value) {

                      if(value==null || value.isEmpty){
                        return 'Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: TextFormField(
                    controller: _stateController,
                    decoration: InputDecoration(
                        labelText: 'State',
                        // hintText: _stateController.text,
                        labelStyle: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),
                        border: UnderlineInputBorder()
                    ),
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.teal),
                    fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, double.infinity)),
                  ),
                  child: Text('SAVE'),
                  onPressed: () async {
                    setState(() {

                    });

                    if (FormKey.currentState!.validate()) {
                      await _addItem();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                        backgroundColor: Colors.green,
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.white),
                            Expanded(child: Text('Profile information has been added Successfully',
                                style: TextStyle(color: Colors.white))),
                          ],
                        ),
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
