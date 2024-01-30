import 'package:amazon/Pages/CartScreen.dart';
import 'package:amazon/Shoppingpages/FavouriteScreen.dart';
import 'package:amazon/models/modelclass.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DBHelper.dart';

class ImagePreviewFoeProduct extends StatefulWidget {
  var dataList;
  ImagePreviewFoeProduct({super.key, required this.dataList});


  @override
  State<ImagePreviewFoeProduct> createState() => _ImagePreviewFoeProductState(dataList);
}

class _ImagePreviewFoeProductState extends State<ImagePreviewFoeProduct> {
  _ImagePreviewFoeProductState(this.dataList);
  var dataList;
  var qnty = 1;

  // final List<Model> dataList;
  // _ImagePreviewFoeProductState( this.dataList);

  Future<void> _addItem() async {
    await SQLHelper.favouriteItem(
        dataList.title,dataList.subtitle,
        dataList.amount, dataList.discription,dataList.image);
    // _refreshJournals();
  }

  Future<void> _addCartItem() async {
    await SQLHelper.createItem(
        dataList.title,dataList.subtitle,
        dataList.amount,dataList.discount,dataList.discription,dataList.size?? '',qnty,dataList.image);
    // _refreshJournals()
    print('Title: ${dataList.title}');
    print('Subtitle: ${dataList.subtitle}');
    print('Amount: ${dataList.amount}');
    print('Discount: ${dataList.discount}');
    print('Discription: ${dataList.discription}');
    print('Size: ${dataList.size}');
    print('Quantity: ${qnty}');
    print('Image: ${dataList.image}');
  }
  bool isButtonTapped = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 15.0),
            child: InkWell(

                 onTap: () {
                   _addItem();
                   Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                 },
                child: Icon(Icons.favorite,color: Colors.black54,size: 30)),
          ),
        ],
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text('${dataList.title}',style: TextStyle(color: Colors.black)),

      ),
      body: Column(
        children: [
          Image(image: AssetImage('assets/images/Amz24.jpeg')),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(image: AssetImage('${dataList.image}'),fit: BoxFit.fill,width: size.width,height: size.height/2),


                  Padding(
                    padding:  EdgeInsets.only(left: 15,top: 25),
                    child: Row(
                      children: [
                        Text('${dataList.title}  ',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19)),
                        Text('${dataList.subtitle}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15,),
                    child: Row(
                      children: [
                        Text('${dataList.amount}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.green.shade900)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15,),
                    child: Row(
                      children: [
                        Text('${dataList.discription}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.deepOrange)),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    height: 3,
                    color: Colors.black38,
                  ),

                  SizedBox(height: 20,),

                Padding(
                  padding:  EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Container(
                        height: size.height/19,
                        width: size.width*0.3,
                        color: Colors.black54,
                        alignment: Alignment.center,
                        child: Text('Top Brands',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 14)),
                      ),
                      SizedBox(width: 10),
                      Text('${dataList.title}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17)),
                    ],
                  ),
                ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15,top: 5),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline_rounded,color: Colors.green,),
                        Text('75% positive ratings from 10K+ customers',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15,top: 5),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline_rounded,color: Colors.green,),
                        Text('10K+ recent orders from this brand',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15,top: 5,bottom: 20),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle_outline_rounded,color: Colors.green,),
                        Text('7+ years on Amazon',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),

                  Container(
                    height: 3,
                    color: Colors.black38,
                  ),
                  SizedBox(height: 20,),


                  ElevatedButton(style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(350, 40)),backgroundColor: MaterialStatePropertyAll(Colors.tealAccent.shade700)),
                      onPressed: () {
                    
                         Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())) ;
                      }, child: Text('Buy Now',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),)),

                  SizedBox(height: 5),

                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(350, 40)),
                      backgroundColor: MaterialStatePropertyAll(
                        isButtonTapped ? Colors.grey : Colors.teal.shade900,
                      ),
                      // Disable the button if it's tapped
                      overlayColor: MaterialStatePropertyAll(Colors.transparent),
                      // Remove the ripple effect
                    ),
                    onPressed: isButtonTapped
                        ? null // Disable the button if it's already tapped
                        : () {
                      _addCartItem();
                      setState(() {
                        isButtonTapped = true; // Mark the button as tapped
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15,top: 5),
                    child: Row(
                      children: [
                        Icon(Icons.lock,color: Colors.black45,),
                        Text('Secure transaction',style: TextStyle(color: Colors.teal),)
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15,top: 5),
                    child: Row(
                      children: [
                        Text('Sold by ',style: TextStyle(fontWeight: FontWeight.w600)),
                        Text('${dataList.title}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.teal)),
                        Text(' and ',style: TextStyle(fontWeight: FontWeight.w600)),
                        Text('Fulfilled by Amazon.',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.teal))
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15,top: 5),
                    child:
                    Text('Shows what is inside. Item often ships in manufacturer container to reduce packaging. If this is a gift, consider shipping to a differenr address.',style: TextStyle(fontWeight: FontWeight.w600)),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: 15,top: 15,bottom: 10),
                    child: Row(
                      children: [
                        Text('Style Note:',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                      ],
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: 15.0),
                    child: Text('Give Yourself a Fashion makeover with this classy three-quarter top from Bebe. Pair this product with slim jeans and a sling bag for a casual look.',style: TextStyle(fontWeight: FontWeight.w600)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
