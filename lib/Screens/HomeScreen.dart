import 'package:clustersforce/Screens/Leaderbooard.dart';
import 'package:clustersforce/customWidgets/button.dart';
import 'package:clustersforce/customWidgets/contestWidget.dart';
import 'package:clustersforce/customWidgets/customDataPage.dart';
import 'package:clustersforce/customWidgets/friendspage.dart';
import 'package:clustersforce/customWidgets/inputField.dart';
import 'package:clustersforce/customWidgets/searchdata.dart';
import 'package:clustersforce/customWidgets/snakebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cfuserdata.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState() ;
  }

}

class HomeState extends State < Home> {
  TextEditingController search = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    CFuserData prder = Provider.of<CFuserData>(context,listen:true);
    CFuserData prderfal = Provider.of<CFuserData>(context,listen:false);


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFECF9FF),
          child: Column(

            children: [
              Container(
                height: 150,
                padding: EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Color(0xFFB0DAFF),
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(35),topRight:Radius.circular(35)) ,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          // spreadRadius: 3,
                          blurRadius: 5
                      ),
                    ]
                ),
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 70,
                            // width: 300,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF5F3C1),
                              borderRadius: BorderRadius.all(Radius.circular(25)) ,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      // spreadRadius: 3,
                                      blurRadius: 5
                                  ),
                                ]
                            ),
                            child: Contest(),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                              boxShadow: [
                              BoxShadow(
                              color: Colors.black12,
                            // spreadRadius: 3,
                            blurRadius: 5
                        ),
          ]
                          ),
                          child: IconButton(
                              onPressed:(){
                                prderfal.setleaderlist() ;
                                Navigator.of(context).push(createRoute("leader", context));
                              },
                              icon: const Icon(Icons.leaderboard_rounded,)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:  const EdgeInsets.fromLTRB(35, 0, 35, 30),
                color: const Color(0xFFECF9FF),
                child:  Column(
                  children: [
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                    ),
                    const Text("Welcome To ClustersForce",
                      style: TextStyle(
                        fontFamily: "sofia",
                        fontSize: 25
                      ),
                    ) ,
                    const SizedBox(
                      height: 30,
                    ),
                    Container(padding:EdgeInsets.symmetric(horizontal: 1),child: DataPage(rating: '${prder.Mydata.rating}', contribution: '${prder.Mydata.contribution}', title: 'Hello ${prder.Mydata.handle}', friendcount: '${prder.Mydata.friendOfCount}', maxrank: '${prder.Mydata.maxRank}', maxrating: '${prder.Mydata.maxRating}', photo: '${prder.Mydata.titlePhoto}', ranking: '${prder.Mydata.rank}',)),
                    const SizedBox(
                      height: 10,
                    ),
                    ClickMe(title: "Detailed Analysis", doing: (){
                      showToast(context, "ruk jaa bhai thodi der") ;
                    }),
                    const SizedBox(
                      height: 40,
                    ),
                    Inputit(controller: search, hinter: "Enter username"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ClickMe(title: "Search", doing: ()async{
                          await prderfal.searchdatafuc(search.text) ;
                          print(prder.searchdata.handle) ;

                        }),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    searchdata() ,
                    SizedBox(
                      height: 40,
                    ),
                    FriendsPage() ,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ) ;
  }
  Route createRoute(String st,BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      (st=="leader")?leaderBoard() :Home() ,
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