/*
import 'package:amazon/Pages/productlist/ImagePreviewScreen.dart';
import 'package:flutter/material.dart';

import '../bottombar/BottomNavigationBar.dart';
import '../models/modelclass.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Model>listofproduct = [];
  List<Model>listifimg = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofproduct.add(Model(image: 'assets/women/women2.jpeg',title: 'Shasmi',subtitle: 'Orange Stylish Jacket',amount: '₹689',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women3.jpeg',title: 'GRECIILOOKS',subtitle: 'Lycra Solid Fancy Dress',amount: '₹399',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women4.jpeg',title: 'RARE',subtitle: 'Tradition of Fashion',amount: '₹1399',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women5.jpeg',title: 'Janasya',subtitle: 'Floral Printed Co-Ord Set',amount: '₹895',discription: ''));
    listofproduct.add(Model(image: 'assets/women/women6.jpeg',title: 'SIRIL',subtitle: 'Top and Bottom Set',amount: '₹999',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women7.jpeg',title: 'Miss Chase',subtitle: 'Length A-Line Western',amount: '₹949',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women8.jpeg',title: 'ZARA',subtitle: 'Stylish Co-Ord Set',amount: '₹1199',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women9.jpeg',title: 'KERI PERRY',subtitle: 'Latest Tshirt',amount: '₹699',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/women/women10.jpeg',title: 'SAAKI',subtitle: 'White and Brown is Fashion',amount: '₹899',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women11.jpeg',title: 'Lymio',subtitle: 'Dress for Wome!n',amount: '₹999',discription: 'Best Price with coupon'));
    listofproduct.add(Model(image: 'assets/women/women12.jpeg',title: 'SIRIL',subtitle: 'Top and Bottom Set',amount: '₹999',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women13.jpeg',title: 'Miss Chase',subtitle: 'Length A-Line Western',amount: '₹949',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women14.jpg',title: 'ZARA',subtitle: 'Stylish Co-Ord Set',amount: '₹1199',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women15.jpeg',title: 'KERI PERRY',subtitle: 'Latest Tshirt',amount: '₹699',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/women/women16.jpg',title: 'SAAKI',subtitle: 'White and Brown is Fashion',amount: '₹899',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women17.jpeg',title: 'Lymio',subtitle: 'Dress for Wome!n',amount: '₹999',discription: 'Best Price with coupon'));

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: MyFun.bottomNavigation(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text('Top Brands',style: TextStyle(color: Colors.black)),

      ),
      body:Column(
        children: [
          Image(image: AssetImage('assets/images/Menu1.jpeg'),),


          SizedBox(height: 20,),

          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.8/3
            ),
              itemCount: listofproduct.length,
              itemBuilder: (context, index) {
                return  InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreviewScreen(productDetails: listofproduct[index]),));
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height/3.5,
                          width: size.width*0.49,
                          color: Colors.blue,
                          child: Image(image: AssetImage('${listofproduct[index].image}'),fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('${listofproduct[index].title}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('${listofproduct[index].subtitle}',style: TextStyle(color: Colors.black54)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('${listofproduct[index].amount}',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('${listofproduct[index].discription}',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal.shade900)),
                        ),
                      ],
                    ),
                  ),
                );
              },),
          )
        ],
      ),
    );
  }
}

// class Photos{
//   var img;
//   var title;
//
//   Photos({this.img,this.title});
// }*/

import 'package:amazon/Pages/productlist/ImagePreviewScreen.dart';
import 'package:flutter/material.dart';

import '../bottombar/BottomNavigationBar.dart';
import '../models/modelclass.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Model> listofproduct = [];


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    listofproduct.add(Model(image: 'assets/women/women2.jpeg',title: 'Shasmi',subtitle: 'Orange Stylish Jacket',amount: '689',discount: '12',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women3.jpeg',title: 'GRECIILOOKS',subtitle: 'Lycra Solid Fancy Dress',amount: '399',discount: '12',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women4.jpeg',title: 'RARE',subtitle: 'Tradition of Fashion',amount: '1399',discount: '12',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women5.jpeg',title: 'Janasya',subtitle: 'Floral Printed Co-Ord Set',amount: '895',discount: '12',discription: ''));
    listofproduct.add(Model(image: 'assets/women/women6.jpeg',title: 'SIRIL',subtitle: 'Top and Bottom Set',amount: '999',discount: '12',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women7.jpeg',title: 'Miss Chase',subtitle: 'Length A-Line Western',amount: '949',discount: '12',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women8.jpeg',title: 'ZARA',subtitle: 'Stylish Co-Ord Set',amount: '1199',discount: '12',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women9.jpeg',title: 'KERI PERRY',subtitle: 'Latest Tshirt',amount: '699',discount: '12',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/women/women10.jpeg',title: 'SAAKI',subtitle: 'White and Brown is Fashion',amount: '899',discount: '12',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women11.jpeg',title: 'Lymio',subtitle: 'Dress for Wome!n',amount: '999',discount: '12',discription: 'Best Price with coupon'));
    listofproduct.add(Model(image: 'assets/women/women12.jpeg',title: 'SIRIL',subtitle: 'Top and Bottom Set',amount: '999',discount: '12',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women13.jpeg',title: 'Miss Chase',subtitle: 'Length A-Line Western',amount: '949',discount: '12',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women14.jpg',title: 'ZARA',subtitle: 'Stylish Co-Ord Set',amount: '1199',discount: '12',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women15.jpeg',title: 'KERI PERRY',subtitle: 'Latest Tshirt',amount: '699',discount: '12',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/women/women16.jpg',title: 'SAAKI',subtitle: 'White and Brown is Fashion',amount: '899',discount: '12',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women17.jpeg',title: 'Lymio',subtitle: 'Dress for Wome!n',amount: '999',discount: '12',discription: 'Best Price with coupon'));

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      bottomNavigationBar: MyFun.bottomNavigation(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(Icons.diamond_sharp,color: Colors.black,size: 30,),
        ),
        title: Text('Top Brands',style: TextStyle(color: Colors.black,fontSize: 25)),
      ),
      body : Column(
        children: [
          Image(image: AssetImage('assets/images/Menu1.jpeg')),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.80 / 3,
                  //crossAxisSpacing: 20,
                  // mainAxisSpacing: 60
                ),
                itemCount: listofproduct.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreviewScreen(productDetails : listofproduct[index]),));
                      //print('index = ${index}');
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image(image: AssetImage('${listofproduct[index].image}'),fit: BoxFit.fill,),
                            height: size.height/5,
                            width: size.width*0.49,
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${listofproduct[index].title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${listofproduct[index].subtitle}',style: TextStyle(color: Colors.black54)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text('₹${listofproduct[index].amount}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                                Text('${listofproduct[index].discount}% OFF',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${listofproduct[index].discription}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
