import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clustersforce/Screens/Setusername.dart';
import 'package:clustersforce/customWidgets/fetchDataText.dart';
import 'package:clustersforce/providers/cfuserdata.dart';
import 'package:clustersforce/providers/contestProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';


class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashState() ;
  }

}
class SplashState extends State<Splash>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate() ;
  }
  void navigate()async{
    await Future.delayed(const Duration(seconds: 2)) ;
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? username = sp.getString("cfname") ;
    ContestProvid prdercontest = Provider.of<ContestProvid>(context,listen:false);

    if(username==null){ //
      Navigator.of(context,).pushAndRemoveUntil(
          createRoute("set", context), (Route<dynamic> route) => false);
    }
    else {
      CFuserData prder = Provider.of<CFuserData>(context,listen:false);
      prder.changefetch(true) ;
      await prder.getmydata(username) ;
      await prdercontest.fetchContests() ;
      if(sp.getStringList("friendName") != null){
        prder.friendName =sp.getStringList("friendName")! ;
      }
      await prder.getfriendData() ;
      prder.changefetch(false) ;

      Navigator.of(context,).pushAndRemoveUntil(
          createRoute("home", context), (Route<dynamic> route) => false);
    }

  }

  @override
  Widget build(BuildContext context) {
    CFuserData prder = Provider.of<CFuserData>(context,listen: true);

    return Scaffold(
      // backgroundColor: Color(0xFFF7F4DD),
        backgroundColor: Color(0xFFF7F3D8),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
          Container(
            // height: 400,
            width: 300,
            child: const Image(  image: AssetImage("assets/image/logo.png"),
            ),
          ),
            SizedBox(
              height: 300,
            ) ,
            (prder.fetch)?fetchText():SizedBox(),
          ],
        ),
      ),
    ) ;
  }

  Route createRoute(String st,BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      (st=="set")? SetScreen():Home() ,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}


