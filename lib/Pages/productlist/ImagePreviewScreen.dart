/*
// ignore_for_file: no_logic_in_create_state, prefer_typing_uninitialized_variables, prefer_const_constructors, non_constant_identifier_names

import 'package:amazon/DBHelper/DBHelper.dart';
import 'package:amazon/Pages/CartScreen.dart';
import 'package:amazon/Shoppingpages/FavouriteScreen.dart';
import 'package:amazon/models/modelclass.dart';
import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatefulWidget {
    var productDetails;
   ImagePreviewScreen({super.key, required this.productDetails});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState(productDetails);
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  _ImagePreviewScreenState( this.productDetails);
   var productDetails;

   var k="XS";
   var qnty = 1;

 List <Sizeofdress> dresssize = [];


  @override
  void initState() {
    data = productDetails;
    // TODO: implement initState
    super.initState();
    dresssize.add(Sizeofdress('XS'));
    dresssize.add(Sizeofdress('S'));
    dresssize.add(Sizeofdress('M'));
    dresssize.add(Sizeofdress('L'));
    dresssize.add(Sizeofdress('XL'));
  }
   bool isLiked = false;
  int SelectIndex = 0;
 // get index => getSize;
 // get getSize => dresssize[index].size1;

 var data;


  Future<void> _addItem() async {
    await SQLHelper.favouriteItem(
        productDetails.title,productDetails.subtitle,
      productDetails.amount,productDetails.discount,productDetails.discription,productDetails.image);
 // _refreshJournals();
  }

  Future<void> _addCartItem() async {
    await SQLHelper.createItem(
        productDetails.title,productDetails.subtitle,
        productDetails.amount,productDetails.discount,productDetails.discription,k,qnty,productDetails.image);
    // _refreshJournals();
  }
  // void _refreshJournals() async {
  //   final data = await SQLHelper.getfvrtItems();
  //   setState(() {
  //     productDetails = data;
  //     //_isLoading = false;
  //   });
  // }

  bool isButtonTapped = false; // Add this variable

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 15.0),
            child: InkWell(
                onTap: () async {
                  setState(() {

                  });
                 await _addItem();

                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                },
                child: Icon(Icons.favorite,color: isLiked == true? Colors.red: Colors.black54,size: 30)),
          ),
        ],
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text('${productDetails.title}',style: TextStyle(color: Colors.black)),

      ),
      body: Column(
        children: [
          Image(image: AssetImage('assets/images/Amz24.jpeg')),

         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Image(image: AssetImage('${productDetails.image}'),fit: BoxFit.fill,width: size.width,height: size.height/2,),


              Padding(
                padding:  EdgeInsets.only(left: 15,top: 25),
                child: Row(
                  children: [
                    Text('${productDetails.title}',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19)),
                    Text('${productDetails.subtitle}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 15,),
                child: Row(
                  children: [
                    Text('${productDetails.amount}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color: Colors.green.shade900)),
                  ],
                ),
              ),
                 Padding(
                   padding:  EdgeInsets.only(left: 15,),
                   child: Row(
                     children: [
                       Text('${productDetails.discription}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.deepOrange)),
                     ],
                   ),
                 ),

              SizedBox(height: 10,),
              Container(
                height: 3,
                color: Colors.black38,
              ),
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Row(
                 children: [
                   Text('Size:  ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                   Text(k,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),
                 ],
               ),
             ),
             */
/**//*


             Wrap(
             direction: Axis.horizontal,
           children: List.generate(5, (index){
           return Container(
            margin: EdgeInsets.only(right: 10),
            child: ElevatedButton(style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(20, 40)),backgroundColor: MaterialStatePropertyAll(SelectIndex == index? Colors.teal.shade700:Colors.black54)),
            onPressed: () {
             setState(() {
             SelectIndex = index;
             if(SelectIndex==0){k="XS";}
             if(SelectIndex==1){k="S";}
             if(SelectIndex==2){k="M";}
             if(SelectIndex==3){k="L";}
             if(SelectIndex==4){k="XL";}
             });
        }, child: Text('${dresssize[index].size1}',style: TextStyle(color: Colors.white),)),
        );

          }),
         ),


    SizedBox(height: 10,),
              Container(
                height: size.height/17,
                child: Padding(
                  padding:  EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Icon(Icons.recycling),
                      Text('Find Your Size',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
                color: Colors.black12,
              ),
                 SizedBox(height: 10,),

              ElevatedButton(style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(350, 40)),backgroundColor: MaterialStatePropertyAll(Colors.tealAccent.shade700)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));

                  }, child: Text('Buy Now',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),)),

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
                       Text('${productDetails.title}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.teal)),
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
                 ),
                 SizedBox(height: 40,)
               ],
             ),
           ),
         ),
        ],
      ),

    );
  }
}

class Sizeofdress{
  var size1;
  Sizeofdress(this.size1);
}*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../DBHelper/DBHelper.dart';
import '../../Shoppingpages/CashPaymentScreen.dart';
import '../CartScreen.dart';

class ImagePreviewScreen extends StatefulWidget {
  var productDetails;

  ImagePreviewScreen({Key? key, required  this.productDetails}) : super(key: key);

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState(productDetails);
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {

  List<Map<String, dynamic>> _journals = [];
  List<Map<String, dynamic>> _journals1 = [];

  void _refreshJournals() async {
    final data = await SQLHelper.getfvrtItems();
    setState(() {
      _journals = data;
      print('data : $data');
    });
  }
  void _refreshJournals1() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals1 = data;
      print('data : $data');
    });
  }
  var qty = 1;
  List<Size1> clothsize = [];
  var defaultsize = 'XS';
  var index = 2;
  get ab => clothsize[index].size1;
  @override
  void initState() {

    clothsize.add(Size1('XS'));
    clothsize.add(Size1('S'));
    clothsize.add(Size1('M'));
    clothsize.add(Size1('L'));
    clothsize.add(Size1('XL'));
    _refreshJournals();
    _refreshJournals1();
    // TODO: implement initState
    super.initState();
  }


  var productDetails;
  _ImagePreviewScreenState(this.productDetails);
  int selectedindex = 0;

  Future<void> _addItem() async {
    await SQLHelper.favouriteItem(
        productDetails.title,productDetails.subtitle,
        productDetails.amount,productDetails.discription,productDetails.image);
    _refreshJournals();
  }
  Future<void> _addcartItem() async {
    await SQLHelper.createItem(
        productDetails.title,productDetails.subtitle,
        productDetails.amount,productDetails.discount,productDetails.discription,defaultsize,qty,productDetails.image);
    _refreshJournals();
  }
  bool like = false;
  bool isButtonTapped = false;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text('${productDetails.title}',style: TextStyle(color: Colors.black,fontSize: 25)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () async {

                  await _addItem();
                  setState(() {
                    like = !like;
                  });
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                },
                child: Icon(Icons.favorite,color: like ? Colors.red : Colors.grey,)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: size.height/2,
                width: size.width*0.9,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Image(image: AssetImage('${productDetails.image}'),fit: BoxFit.fill,),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Expanded(child: Text('${productDetails.title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                //  SizedBox(width: 10,),
                Expanded(child: Text('${productDetails.subtitle}')),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('₹${productDetails.amount}',style: TextStyle(color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold)),
                  Text('${productDetails.discount}% OFF',style: TextStyle(color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text('${productDetails.discription}',style: TextStyle(color: Colors.teal,fontSize: 15,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(
              height: 3,
              color: Colors.black38,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text('Size:',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                  SizedBox(width: 10,),
                  Text('${defaultsize}',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Wrap(
                direction: Axis.horizontal,
                children: List.generate(5, (index){
                  return Container(
                    height: size.height/15,
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(selectedindex == index ? Colors.blue : Colors.white)),
                      onPressed: () {
                        setState(() {
                          selectedindex=index;
                          if(selectedindex==0){defaultsize="XS";}
                          if(selectedindex==1){defaultsize="S";}
                          if(selectedindex==2){defaultsize="M";}
                          if(selectedindex==3){defaultsize="L";}
                          if(selectedindex==4){defaultsize="XL";}
                        });
                      }, child: Text('${clothsize[index].size1}',style: TextStyle(color: Colors.black)),

                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 20,),
            Container(
              height: size.height/17,
              child: Padding(
                padding:  EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.recycling),
                    Text('Find Your Size',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
              color: Colors.black12,
            ),
            SizedBox(height: 20,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     SizedBox(width: 20,),
            //     Expanded(
            //       child: ElevatedButton(
            //           style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.pink.shade200)),
            //           onPressed: () {
            //             Navigator.push(context, MaterialPageRoute(builder: (context) => CashPaymentScreen(),));
            //           }, child: Padding(
            //         padding: const EdgeInsets.all(17.0),
            //         child: Text('BUY NOW',style: TextStyle(color: Colors.black)),
            //       )),
            //     ),
            //     SizedBox(width: 20,),
            //     Expanded(
            //       child: ElevatedButton(
            //         style: ButtonStyle(
            //           fixedSize: MaterialStatePropertyAll(Size(350, 40)),
            //           backgroundColor: MaterialStatePropertyAll(
            //             isButtonTapped ? Colors.grey : Colors.pink,
            //           ),
            //           // Disable the button if it's tapped
            //           overlayColor: MaterialStatePropertyAll(Colors.transparent),
            //           // Remove the ripple effect
            //         ),
            //         onPressed: isButtonTapped
            //             ? null // Disable the button if it's already tapped
            //             : () {
            //           _addcartItem();
            //           setState(() {
            //             isButtonTapped = true; // Mark the button as tapped
            //           });
            //         },
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Icon(Icons.shopping_bag_outlined),
            //             Text(
            //               'Add to Cart',
            //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: 20,),
            //   ],
            // ),
            Center(
              child: ElevatedButton(style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(350, 40)),backgroundColor: MaterialStatePropertyAll(Colors.tealAccent.shade700)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));

                  }, child: Text('Buy Now',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),)),
            ),
            SizedBox(height: 5),
            Center(
              child: ElevatedButton(
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
                  _addcartItem();
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
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text('Style Note : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text('Give Yourself a Fashion makeover with this classy three-quarter top from ${productDetails.title}.'
                  ' Pair this navy blue piece with slim jens and a sling bag for a casual day look',
                style: TextStyle(fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }
}

class Size1{
  var size1;

  Size1(this.size1);
}