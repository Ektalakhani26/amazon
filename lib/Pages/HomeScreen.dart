import 'package:amazon/Pages/productlist/FootWear.dart';
import 'package:amazon/Pages/productlist/HouseHold.dart';
import 'package:amazon/Pages/productlist/KidsFashion.dart';
import 'package:amazon/Pages/productlist/MensFashion.dart';
import 'package:amazon/Pages/productlist/Perfume.dart';
import 'package:amazon/Pages/productlist/WomensFashion.dart';
import 'package:amazon/Shoppingpages/FavouriteScreen.dart';
import 'package:amazon/bottombar/BottomNavigationBar.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MyFun.bottomNavigation(context),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height/9.5,
                  //  width: size.width*0.9,
                    decoration: BoxDecoration(color: Colors.tealAccent,gradient: LinearGradient(colors: [Colors.teal.shade500,Colors.tealAccent.shade100])),
                    child: Row(
                      children: [
                        Container(
                          height: size.height/16,
                          width: size.width*0.77,
                           margin: EdgeInsets.only(left: 10),
                           padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                            ],
                          ),
                        ),
                        Icon(Icons.notifications_rounded,color: Colors.amber.shade800,size: 30),
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                            },
                            child: Icon(Icons.favorite,color: Colors.red.shade800,size: 30,))
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Container(
              height: 3,
              color: Colors.deepOrange,
            ),


            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.amber.shade200,Colors.tealAccent.shade100])),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                      height: size.height/4,
                      width: 370,
                      decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 3)),
                      child: Image(image: AssetImage('assets/images/Amz7.jpg'),fit: BoxFit.cover),
                    ),

                  SizedBox(height: 5),
                  CarouselSlider(
                    items : [
                      Container(
                        height: size.height/2,
                        width: 370,
                        child: Image(image: AssetImage('assets/images/Amz8.jpeg'),fit: BoxFit.cover),
                      ),
                      Container(
                        height:  size.height*0.7,
                        width: 370,
                        child: Image(image: AssetImage('assets/images/amz9.jpeg'),fit: BoxFit.cover),
                      ),
                      Container(
                        height:  size.height*0.7,
                        width: 370,
                        color: Colors.white60,
                        child: Image(image: AssetImage('assets/images/amz10.jpeg'),fit: BoxFit.cover),
                      ),
                      Container(
                        height:  size.height*0.7,
                        width: 370,
                        child: Image(image: AssetImage('assets/images/amz11.jpeg'),fit: BoxFit.cover),
                      ),
                      Container(
                        height:  size.height*0.7,
                        width: 370,
                        child: Image(image: AssetImage('assets/images/amz12.jpeg'),fit: BoxFit.cover),
                      ),
                    ], options: CarouselOptions(
                    height: 180,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves. fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    viewportFraction: 1,
                  ),
                  ),
                  SizedBox(height: 20),

                  Container(
                    height: size.height/12,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/amz13.jpeg'),fit: BoxFit.fill)),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: Colors.amber,
                              child: Icon(Icons.fire_truck_sharp,color: Colors.black),
                            ),
                            Text('Free Delivery\nOn First Order',style: TextStyle(fontWeight: FontWeight.w600),),

                            CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: Colors.amber,
                              backgroundImage: AssetImage('assets/images/Amz13.png'),
                            ),
                            Text('Pay On\nDelivery',style: TextStyle(fontWeight: FontWeight.w600)),

                            CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: Colors.amber,
                              backgroundImage: AssetImage('assets/images/Amz14.png'),
                            ),
                            Text('Easy\nReturns',style: TextStyle(fontWeight: FontWeight.w600))
                          ],
                        ),
                        Text('Get 20% cashback upto on ₹100 on first purchase',style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding:  EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text('Budget picks for all',style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text('under ₹299',style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              height: size.height/5,
                              width: size.width/2.3,
                              child: Image(image: AssetImage('assets/images/amz15.jpeg'),fit: BoxFit.fill),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MensFashion(),));
                            },
                          ),
                          Text("Men's Fashion" ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              height: size.height/5,
                              width: size.width/2.3,
                              child: Image(image: AssetImage('assets/women/women1.jpeg'),fit: BoxFit.fill),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => WomenFashion(),));
                            },
                          ),
                          Text("Women's wear" ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600))
                        ],
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => KidsFashion(),));
                            },
                            child: Container(
                              height: size.height/5,
                              width: size.width/2.3,
                              child: Image(image: AssetImage('assets/images/amz18.jpeg'),fit: BoxFit.fill),
                            ),
                          ),
                          Text("Kid's dresses & more"  ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600))
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FootWear(),));
                            },
                            child: Container(
                              height: size.height/5,
                              width: size.width/2.3,
                              child: Image(image: AssetImage('assets/footimg/Foot1.jpeg'),fit: BoxFit.fill),
                            ),
                          ),
                          Text('Footware' ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600))
                        ],
                      ),

                    ],
                  ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Perfumes(),));
                                },
                                child: Container(
                                  height: size.height/5,
                                  width: size.width/2.3,
                                  child: Image(image: AssetImage('assets/Prfum/Prfum1.jpeg'),fit: BoxFit.fill),
                                ),
                              ),
                              Text('Perfumes |Starting ₹299' ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600))
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HouseHold(),));
                                },
                                child: Container(
                                  height: size.height/5,
                                  width: size.width/2.3,
                                  child: Image(image: AssetImage('assets/household/household1.jpeg'),fit: BoxFit.fill),
                                ),
                              ),
                              Text('House Holds' ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600))
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),
                      Container(
                        height: 3,
                        color: Colors.black45,
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(top: 10,bottom: 10),
                      //   height: size.height/4,
                      //   width: size.width,
                      //  decoration: BoxDecoration(border:Border.all(color: Colors.red,width: 3) ),
                      //   child: Image(image: AssetImage('assets/images/Amz23.jpeg'),fit: BoxFit.cover,),
                      // ),

                  ],),),
              ),
            ),],),
      ),
    );
  }
}
