import 'package:flutter/material.dart';

import '../../models/modelclass.dart';
import 'ImagePreviewForProducts.dart';
import 'ImagePreviewScreen.dart';

class Perfumes extends StatefulWidget {
  const Perfumes({super.key});

  @override
  State<Perfumes> createState() => _PerfumesState();
}

class _PerfumesState extends State<Perfumes> {

  List<Model>listofproduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofproduct.add(Model(image: 'assets/Prfum/prfm2.jpeg',title: 'HIGHLANDER',subtitle: 'Cotton Slim Fit Casual Shirts',amount: '489',discount: '50',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/Prfum/prfm8.jpeg',title: 'NECK',subtitle: 'Slim Fit Casual Shirts',amount: '699',discount: '52',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/Prfum/prfm9.jpeg',title: 'Greek God',subtitle: 'Slim Fit Casual Shirt',amount: '539',discount: '35',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/Prfum/prfm5.jpeg',title: 'Blue Lady',subtitle: 'Check Boxy Casual Shirt',amount: '895',discount: '40',discription: ''));
    listofproduct.add(Model(image: 'assets/Prfum/prfm6.jpeg',title: 'Guerlain',subtitle: 'Cotton Casual Shirt',amount: '419',discount: '45',discription: 'Best Price with coupon'));
    listofproduct.add(Model(image: 'assets/Prfum/prfm7.jpeg',title: 'MYOP',subtitle: 'Checked Pur Cotton Shirt',amount: '699',discount: '50',discription: ''));
    listofproduct.add(Model(image: 'assets/Prfum/prfm3.jpeg',title: 'Accent',subtitle: 'Resort fantasy Casual Shirt',amount: '431',discount: '30',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/Prfum/prfm4.jpeg',title: 'Snitch',subtitle: 'Men Casual Cotton Shirts',amount: '699',discount: '33',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/Prfum/prfm10.jpeg',title: 'DJOKR',subtitle: 'Slim Fit Cotton Casual Shirts',amount: '999',discount: '25',discription: ''));
    listofproduct.add(Model(image: 'assets/Prfum/prfm11.jpeg',title: 'High Fragrance',subtitle: 'Casual Pure Cotton Shirts',amount: '619',discount: '35',discription: 'Best Price with coupon'));


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
          title: Text("Perfumes"),
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
                                Text('${listofproduct[index].discount}% off',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${listofproduct[index].discription}',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal.shade700)),
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
