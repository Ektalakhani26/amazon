import 'package:amazon/Pages/productlist/ImagePreviewScreen.dart';
import 'package:flutter/material.dart';

import '../../models/modelclass.dart';

class MensFashion extends StatefulWidget {
  const MensFashion({super.key});

  @override
  State<MensFashion> createState() => _MensFashionState();
}

class _MensFashionState extends State<MensFashion> {
  
  List<Model>listofproduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofproduct.add(Model(image: 'assets/images/Amz25.jpeg',title: 'HIGHLANDER',subtitle: 'Cotton Slim Fit Casual Shirts',amount: '409',discount: '25',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/images/Amz31.jpeg',title: 'Metronaut',subtitle: 'Slim Fit Casual Shirts',amount: '399',discount: '35',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/images/Amz27.jpeg',title: 'GANT',subtitle: 'Slim Fit Casual Shirt',amount: '439',discount: '20',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/images/Amz33.jpeg',title: 'Powerlook',subtitle: 'Check Boxy Casual Shirt',amount: '895',discount: '35',discription: ''));
    listofproduct.add(Model(image: 'assets/images/Amz32.jpeg',title: 'Sutidora',subtitle: 'Cotton Casual Shirt',amount: '419',discription: 'Best Price with coupon'));
    listofproduct.add(Model(image: 'assets/images/Amz26.jpeg',title: 'U.S.Polo Assn.',subtitle: 'Checked Pur Cotton Shirt',amount: '2699',discount: '40',discription: ''));
    listofproduct.add(Model(image: 'assets/images/Amz34.jpeg',title: 'Moda Rapido',subtitle: 'Resort fantasy Casual Shirt',amount: '431', discount: '25',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/images/Amz25.jpeg',title: 'Snitch',subtitle: 'Men Casual Cotton Shirts',amount: '1699',discount: '15',discription: 'Only Few Left!'));
    listofproduct.add(Model(image: 'assets/images/Amz30.jpeg',title: 'Park Avanue',subtitle: 'Slim Fit Cotton Casual Shirts',amount: '1099',discount: '38',discription: ''));
    listofproduct.add(Model(image: 'assets/images/Amz25.jpeg',title: 'Sutidora',subtitle: 'Casual Pure Cotton Shirts',amount: '419',discount: '30',discription: 'Best Price with coupon'));
    listofproduct.add(Model(image: 'assets/images/Amz27.jpeg',title: 'Snitch',subtitle: 'Stripped Slim Fit Cotton Shirt',amount: '999',discount: '45',discription: ''));
    listofproduct.add(Model(image: 'assets/images/Amz31.jpeg',title: 'HIGHLANDER',subtitle: 'Cotton Slim Fit Casual Shirts',amount: '409',discount: '30',discription: 'Delivery by Aug 12'));
    listofproduct.add(Model(image: 'assets/images/Amz29.jpeg',title: 'Powerlook',subtitle: 'Check Boxy Casual Shirt',amount: '895',discount: '25',discription: ''));
    listofproduct.add(Model(image: 'assets/images/Amz28.jpeg',title: 'Moda Rapido',subtitle: 'Slim Fit Cotton Casual Shirts',amount: '431',discount: '35',discription: 'Delivery by Aug 12'));
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
          title: Text("Men's Fashion"),
        ),
       body: Column(
         children: [
           Image(image: AssetImage('assets/images/Menu2.jpeg')),
           SizedBox(height: 10,),
           Expanded(
             child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                 maxCrossAxisExtent: 200,
                 childAspectRatio: 1.7 /3
             ),
                 itemCount: listofproduct.length,
                 itemBuilder: (context, index) {
                   return  GestureDetector(
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
                                 Text('₹${listofproduct[index].amount}  ',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange)),
                                 Text(' ${listofproduct[index].discount}% off',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange)),

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
