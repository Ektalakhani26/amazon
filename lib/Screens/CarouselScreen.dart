import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SplashScreen.dart';
import 'loginScreen.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  List<model> listall = [];
  int currentpage = 0;
  PageController _pagecontrol = PageController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listall.add(model(img: 'assets/images/Amz2.png',title: "Purchase Online",disc: "Amazon first launched its distribution network in 1997 with two fulfillment centers in Seattle and New Castle, Delaware. Amazon has several types of distribution facilities consisting of cross-dock centers, fulfillment centers, sortation centers, delivery stations, Prime now hubs, and Prime air hubs."));
    listall.add(model(img: 'assets/images/Amz5.png',title: "Track Your Order",disc: "Amazon has 310 million customers worldwide. For comparison, that's almost as many shoppers as the entire population of the U.S. eTail reports that 90 million of these active global customers are Amazon Prime members"));
    listall.add(model(img: 'assets/images/Amz3.png',title: "Get Your Order",disc: "Everyone who works for Customer Service is focused on preventing and solving problems for customers, from designing and developing self-service technologies, building and managing products and programs, to interacting directly with customers."));

  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Amz6.jpg'),fit: BoxFit.cover)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i < listall.length; i++)...[
                  Padding(
                    padding:  EdgeInsets.all(5.0),
                    child: Container(
                      height: (currentpage == i) ? 12 : 8,
                      width: (currentpage == i) ? 12 : 8,
                      decoration: BoxDecoration(
                        color: (currentpage == i) ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  )
                ]
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(onPressed: () async {
                  setState(() {

                  });

                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(SplashScreenState.SPLASH, true);
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselScreen(),));
                  //  _pagecontrol =  isviewed != 0 ? CarouselScreen() : LogInScreen();
                  currentpage == listall.length-1 ? Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),)) : 'Next';
                  _pagecontrol.animateToPage(currentpage+1, duration: Duration(seconds: 1), curve: Curves.linear);

                }, child: Text((currentpage==listall.length-1) ? 'Get Started' : ' Next')),


              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: PageView.builder(
          controller: _pagecontrol,
          itemCount: listall.length,
          onPageChanged: (value) {
            currentpage = value;
            setState(() {

            });
          },
          itemBuilder: (context, index) {
            return OtherScreen.name(listall[index]);

          },
        ),
      ),
    );
  }
}
class OtherScreen extends StatefulWidget {
  OtherScreen({Key? key}) : super(key: key);
  model? obj;
  OtherScreen.name(this.obj);

  @override
  State<OtherScreen> createState() => _OtherScreenState(obj!);
}

class _OtherScreenState extends State<OtherScreen> {
  // List<model> listall = [];
  model? obj;

  _OtherScreenState(this.obj);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(

      body: Center(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Amz6.jpg'),fit: BoxFit.cover)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('${obj?.img}'),fit: BoxFit.cover,height: size.height/2.5),
              Text('${obj!.title}',style: TextStyle(fontFamily: 'LibreBaskerville',fontSize: 25)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('${obj!.disc}',style: TextStyle(fontFamily: 'LibreBaskerville',fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class model{
  var img;
  var title;
  var disc;

  model({this.img,this.title,this.disc});
}






