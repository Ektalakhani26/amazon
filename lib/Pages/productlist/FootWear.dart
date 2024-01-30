import 'package:flutter/material.dart';

import '../../models/modelclass.dart';
import 'ImagePreviewForProducts.dart';
import 'ImagePreviewScreen.dart';

class FootWear extends StatefulWidget {
  const FootWear({super.key});

  @override
  State<FootWear> createState() => _FootWearState();
}

class _FootWearState extends State<FootWear> {

  List<Model>listofproduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofproduct.add(Model(image: 'assets/footimg/foot2.jpeg',title: 'BATA',subtitle: 'Comfort to Fly',amount: '409',discount: '33',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/footimg/foot3.jpeg',title: 'MOCHI',subtitle: 'Slim Fit Casual Shirts',amount: '399',discount: '35',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/footimg/foot4.jpeg',title: 'METRO',subtitle: 'Slim Fit Casual Shirt',amount: '439',discount: '42',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/footimg/foot5.jpeg',title: 'Liberty',subtitle: 'Check Boxy Casual Shirt',amount: '895',discount: '51',discription: ''));
    listofproduct.add(Model(image: 'assets/footimg/foot6.jpeg',title: 'Adidas',subtitle: 'Cotton Casual Shirt',amount: '419',discount: '43',discription: 'Best Price with coupon'));
    listofproduct.add(Model(image: 'assets/footimg/foot7.jpeg',title: 'Nike',subtitle: 'Checked Pur Cotton Shirt',amount: '2699',discount: '30',discription: ''));
    listofproduct.add(Model(image: 'assets/footimg/foot8.jpeg',title: 'BATA',subtitle: 'Resort fantasy Casual Shirt',amount: '431',discount: '45',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/footimg/foot9.jpeg',title: 'Clarks',subtitle: 'Men Casual Cotton Shirts',amount: '1699',discount: '48',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/footimg/foot10.jpeg',title: 'Adidas',subtitle: 'Slim Fit Cotton Casual Shirts',amount: '1099',discount: '35',discription: ''));
    listofproduct.add(Model(image: 'assets/footimg/foot11.jpeg',title: 'MOCHI',subtitle: 'Casual Pure Cotton Shirts',amount: '419',discount: '33',discription: 'Best Price with coupon'));


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
          title: Text("Footware"),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreviewFoeProduct(dataList: listofproduct[index]),));
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
                                Text('₹${listofproduct[index].discount}% off',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange)),
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
