// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_brace_in_string_interps, avoid_print

/*import 'package:flutter/material.dart';

import '../DBHelper/DBHelper.dart';
import '../models/modelclass.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});




  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<Map<String, dynamic>> listofFavourite = [];


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Favourite Screen'),
      ),
     body: Column(
       children: [
         Expanded(flex: 1,
           child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 200,
               childAspectRatio: 1.9/3
           ),
             itemCount: listofFavourite.length,
             itemBuilder: (context, index) {
               return  Container(
                 decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       height: size.height/3.5,
                       width: size.width*0.49,
                       color: Colors.blue,
                       child: Image(image: AssetImage('${listofFavourite[index]['fileImg']}'),fit: BoxFit.cover),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: Text('${listofFavourite[index]['title']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: Text('${listofFavourite[index]['subtitle']}',style: TextStyle(color: Colors.black54)),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: Text('${listofFavourite[index]['price']}',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepOrange)),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: Text('${listofFavourite[index]['description']}',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal.shade900)),
                     ),
                   ],
                 ),
               );
             },),
         ),
       ],
     ),
    );
  }
}*/

import 'package:flutter/material.dart';
import '../DBHelper/DBHelper.dart';


class FavoriteScreen extends StatefulWidget {

  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  List<Map<String, dynamic>>? listfavorite = [];

  void _refreshJournals() async {
    final data = await SQLHelper.getfvrtItems();
    setState(() {
      listfavorite = data;
    });
  }

  void _deleteItem(int id) async {
    await SQLHelper.deletefvrtItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  void initState() {
    _refreshJournals();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.black,)),
          title: Text('Favorite Profile',style: TextStyle(color: Colors.black)),
        ),
        body: Column(
          children: [
            //  Image(image: AssetImage('assets/freeshipping.jpeg')),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    //crossAxisSpacing: 20,
                    // mainAxisSpacing: 60
                  ),
                  itemCount: listfavorite?.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetail1(productdetail: productlist[index]),));
                        print('index = ${index}');
                      },
                      child: Container(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image(image: AssetImage('${listfavorite![index]["image"]}'),fit: BoxFit.fill,),
                              height: size.height/5,
                              width: size.width*0.49,
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text('${listfavorite![index]["title"]}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                  SizedBox(width: 30,),
                                  InkWell(
                                      onTap: () {
                                        _deleteItem(listfavorite![index]["id"]);
                                      },
                                      child: Icon(Icons.favorite,color: Colors.red.shade800,)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${listfavorite![index]["subtitle"]}',style: TextStyle(color: Colors.black54)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${listfavorite![index]["price"]}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${listfavorite![index]["description"]}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal)),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                      ),
                    );
                  }),
            ),
          ],
        )
    );
  }
}
