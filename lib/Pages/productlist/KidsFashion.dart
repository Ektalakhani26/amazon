import 'package:flutter/material.dart';

import '../../models/modelclass.dart';
import 'ImagePreviewScreen.dart';

class KidsFashion extends StatefulWidget {
  const KidsFashion({super.key});

  @override
  State<KidsFashion> createState() => _KidsFashionState();
}

class _KidsFashionState extends State<KidsFashion> {

  List<Model>listofproduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofproduct.add(Model(image: 'assets/kids/kids1.jpeg',title: 'HIGHLANDER',subtitle: 'Cotton Slim Fit Casual Shirts',amount: '799',discount: '25',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/kids/kids2.jpeg',title: 'Metronaut',subtitle: 'Slim Fit Casual Shirts',amount: '699',discount: '33',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/kids/kids3.jpeg',title: 'GANT',subtitle: 'Slim Fit Casual Shirt',amount: '649',discount: '40',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/kids/kids4.jpg',title: 'Powerlook',subtitle: 'Check Boxy Casual Shirt',amount: '295',discount: '42',discription: ''));
    listofproduct.add(Model(image: 'assets/kids/kids5.jpeg',title: 'Sutidora',subtitle: 'Cotton Casual Shirt',amount: '419',discount: '38',discription: 'Best Price with coupon'));
    listofproduct.add(Model(image: 'assets/kids/kids6.jpeg',title: 'U.S.Polo Assn.',subtitle: 'Checked Pur Cotton Shirt',amount: '269',discount: '25',discription: ''));
    listofproduct.add(Model(image: 'assets/kids/kids7.jpeg',title: 'Moda Rapido',subtitle: 'Resort fantasy Casual Shirt',amount: '599',discount: '40',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/kids/kids8.jpeg',title: 'Snitch',subtitle: 'Men Casual Cotton Shirts',amount: '1699',discount: '45',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/kids/kids9.jpeg',title: 'Park Avanue',subtitle: 'Slim Fit Cotton Casual Shirts',amount: '1099',discount: '33',discription: ''));
    listofproduct.add(Model(image: 'assets/kids/kids10.jpeg',title: 'Sutidora',subtitle: 'Casual Pure Cotton Shirts',amount: '419', discount: '25',discription: 'Best Price with coupon'));


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
          title: Text("Kid's dresses & more"),
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
