import 'dart:math';

import 'package:clustersforce/customWidgets/button.dart';
import 'package:clustersforce/customWidgets/fetchDataText.dart';
import 'package:clustersforce/customWidgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customWidgets/snakebar.dart';
import '../providers/cfuserdata.dart';
import '../providers/contestProvider.dart';
import 'HomeScreen.dart';

class SetScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Stat() ;
  }
}

class Stat extends State<SetScreen>{
  TextEditingController username = TextEditingController() ;


  Future<void> doin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("cfname", username.text) ;
    CFuserData prder = Provider.of<CFuserData>(context,listen:false);
    ContestProvid prdercontest = Provider.of<ContestProvid>(context,listen:false);
    prder.changefetch(true) ;

    await prder.getmydata(username.text) ;
    prder.changefetch(false) ;


    if(prder.Mydata.handle== username.text){
      await prdercontest.fetchContests() ;
      Navigator.of(context,).pushAndRemoveUntil(
          createRoute("home", context), (Route<dynamic> route) => false);
    }
    else {
      showToast(context,"user not exist") ;
      sp.clear() ;
      // show error message
    }
  }
  @override
  Widget build(BuildContext context) {
    CFuserData prder = Provider.of<CFuserData>(context,listen:true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: max(MediaQuery.of(context).size.height,MediaQuery.of(context).size.width),
          padding: const EdgeInsets.all(30),
          color: Color(0xFFABC4AA),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                children: const [
                  Text(
                      "Welcome!",
                    style: TextStyle(
                      fontSize: 40,
                      decoration: TextDecoration.none,
                      color: Color(0xFF245953)
                    ),
                  ),
                ],
              ) ,

              const SizedBox(
                height: 100,
              ),
              Inputit(controller: username, hinter: "your codeforces username"),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  ClickMe(title: "Save and Fetch", doing: ()async{await doin();}),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              (prder.fetch)?fetchText():SizedBox(),
            ],
          ),
        ),
      ),
    ) ;
  }
  Route createRoute(String st,BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      (st=="set")? Home():Home() ,
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