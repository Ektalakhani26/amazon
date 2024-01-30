import 'package:flutter/material.dart';

import '../../models/modelclass.dart';
import 'ImagePreviewScreen.dart';

class WomenFashion extends StatefulWidget {
  const WomenFashion({super.key});

  @override
  State<WomenFashion> createState() => _WomenFashionState();
}

class _WomenFashionState extends State<WomenFashion> {

  List<Model>listofproduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofproduct.add(Model(image: 'assets/women/women2.jpeg',title: 'Shasmi',subtitle: 'Orange Stylish Jacket',amount: '689',discount: '30',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women3.jpeg',title: 'GRECIILOOKS',subtitle: 'Lycra Solid Fancy Dress',amount: '399',discount: '35',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women4.jpeg',title: 'RARE',subtitle: 'Tradition of Fashion',amount: '1399',discount: '40',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women5.jpeg',title: 'Janasya',subtitle: 'Floral Printed Co-Ord Set',amount: '895',discount: '33',discription: ''));
    listofproduct.add(Model(image: 'assets/women/women6.jpeg',title: 'SIRIL',subtitle: 'Top and Bottom Set',amount: '999',discount: '40',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women7.jpeg',title: 'Miss Chase',subtitle: 'Length A-Line Western',amount: '949',discount: '45',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women8.jpeg',title: 'ZARA',subtitle: 'Stylish Co-Ord Set',amount: '1199',discount: '25',discription: 'Free Delivery by Amazon'));
    listofproduct.add(Model(image: 'assets/women/women9.jpeg',title: 'KERI PERRY',subtitle: 'Latest Tshirt',amount: '699',discount: '30',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/women/women10.jpeg',title: 'SAAKI',subtitle: 'White and Brown is Fashion',amount: '899',discount: '33',discription: 'Free Delivery on first order'));
    listofproduct.add(Model(image: 'assets/women/women11.jpeg',title: 'Lymio',subtitle: 'Dress for Wome!n',amount: '999',discount: '45',discription: 'Best Price with coupon'));


  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Women's wear"),
        ),
        body: Column(
          children: [
            Image(image: AssetImage('assets/images/Amz24.jpeg')),

            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.6/3
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
                            child: Row(
                              children: [
                                Text('₹${listofproduct[index].amount}   ',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange)),
                                Text('${listofproduct[index].discount}% off',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange)),

                              ],
                            ),
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
      ),
    );
  }
}
