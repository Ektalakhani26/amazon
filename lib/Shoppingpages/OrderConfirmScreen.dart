
import 'dart:async';
import 'package:amazon/Pages/HomeScreen.dart';
import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:flutter/material.dart';

import '../DBHelper/DBHelper.dart';
import '../bottombar/BottomNavigationBar.dart';

class OrderConformScreen extends StatefulWidget {
  final  cartdata;
  OrderConformScreen({Key? key,  this.cartdata}) : super(key: key);

  @override
  State<OrderConformScreen> createState() => _OrderConformScreenState(cartdata);
}

class _OrderConformScreenState extends State<OrderConformScreen>  with TickerProviderStateMixin{

  late AnimationController scaleController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late Animation<double> scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
  late Animation<double> checkAnimation = CurvedAnimation(parent: checkController, curve: Curves.linear);
  var cartdata;
  _OrderConformScreenState(this.cartdata);

  @override
  void initState() {
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();

    Timer(Duration(seconds: 1) , () async {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      _deleteItem(cartdata['id']);
    },);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    setState(() {
      cartdata!.removeall((item) => item['id'] == id); // Update the cartdata list
    });
  }
  @override
  Widget build(BuildContext context) {
    double circleSize = 140;
    double iconSize = 108;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     // backgroundColor: Colors.green.shade700,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: ParticleOptions(baseColor: Colors.green,particleCount: 50,spawnMaxRadius: 30)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Container(
                  height: circleSize,
                  width: circleSize,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: SizeTransition(
                      sizeFactor: checkAnimation,
                      axis: Axis.horizontal,
                      axisAlignment: -1,
                      child: Center(
                          child: Icon(Icons.check, color: Colors.white, size: iconSize)
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Text('Your Order Is Confirmed!',style: TextStyle(color: Colors.green.shade700,fontSize: 30,fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}
