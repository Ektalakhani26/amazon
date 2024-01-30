import 'package:flutter/material.dart';

import '../DBHelper/DBHelper.dart';
import 'OrderConfirmScreen.dart';

class CashPaymentScreen extends StatefulWidget {
  final cartdata;
  CashPaymentScreen({Key? key,  this.cartdata}) : super(key: key);

  @override
  State<CashPaymentScreen> createState() => _CashPaymentScreenState(cartdata);
}

class _CashPaymentScreenState extends State<CashPaymentScreen> {
  var cartdata;

  _CashPaymentScreenState(this.cartdata);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // cartdata = widget.cartdata;
  }

   _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    setState(() {
     // cartdata!.remove((item) => item['id'] == id); // Update the cartdata list
    });
  }
  final FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.delivery_dining,color: Colors.black,size: 30),
        title: Text('Cash On Delivery',style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: FormKey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20,),
              Image(image: AssetImage('assets/images/freedelivery.jpg'),height: size.height/4.5,width:size.width,fit: BoxFit.fill,),
              SizedBox(height: 20,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.location_on_outlined,size: 30),
                  SizedBox(width: 20,),
                  Text('Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('House no./Buding name'),
                    border: UnderlineInputBorder(),
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
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('Road Name / Area / Colony'),
                    border: UnderlineInputBorder(),
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
                padding:  EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('City'),
                    border: UnderlineInputBorder(),
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
                padding:  EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    label: Text('Contact Number'),
                    border: UnderlineInputBorder(),
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
              SizedBox(height: 20,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal),
                  fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, double.infinity)),
                ),
                onPressed: () async {
                  if (FormKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderConformScreen(cartdata: cartdata)), // Pass the updated cartdata
                    );                  }


                  //await _deleteItem(cartdata![1]['id']);
                  for(int i =0; i<= cartdata.length; i++){
                   await _deleteItem(cartdata![i]['id']);
                  }
                },
                child: Text('Save And Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
