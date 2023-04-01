import 'package:clustersforce/customWidgets/button.dart';
import 'package:clustersforce/customWidgets/snakebar.dart';
import 'package:clustersforce/models/userDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/cfuserdata.dart';
import 'customDataPage.dart';

class searchdata extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return searchState() ;
  }

}

class searchState extends State<searchdata>{
  bool done = false  ;
  @override
  Widget build(BuildContext context) {
    CFuserData prder = Provider.of<CFuserData>(context,listen:true);
    CFuserData prderfal = Provider.of<CFuserData>(context,listen:false);

    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 15,
          vertical: 20),
      onEnd: (){
        if(prder.searchdata.rank!= null && prder.searchdata.rank?.length!=0){
          prderfal.changesrch(true) ;
        }

      },
      decoration: const BoxDecoration(
          color: Color(0xFFDDF7E3),
      ),
      height: (prder.searchdata.handle=="user_not_exist")?70:(prder.searchdata.handle==null || prder.searchdata.handle=="")?0:300,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastOutSlowIn,


      child: (prder.searchdata.handle=="user_not_exist")? Row(
        children: [
          Text("user not exist"),
          IconButton(onPressed: (){
            prderfal.changesrch(false) ;
            prderfal.removesearchdata() ;

          }, icon: Icon(CupertinoIcons.xmark),
          ),
        ],
      ):
      (prder.searchdata.handle==null || prder.searchdata.handle=="")?SizedBox():
      Stack(
        children: [(prder.searchshow)?Column(
          children: [
            Texting(ster: "Current Rating: ${prder.searchdata.rating}") ,
            Texting(ster: "Max Rating: ${prder.searchdata.maxRating}") ,
            Texting(ster: "Current Rank: ${prder.searchdata.rank}") ,
            Texting(ster: "Max rank: ${prder.searchdata.maxRank}") ,
            Texting(ster: "Contribution: ${prder.searchdata.contribution}"),
            Texting(ster: "Friend of: ${prder.searchdata.friendOfCount}") ,
            SizedBox(
              height: 50,
            ) ,
            ClickMe(title: "Add as a friend locally", doing: ()async{
              if(prderfal.searchdata.handle==prderfal.Mydata.handle){
                showToast(context, "It is your account") ;
              }
              else{
                bool same = false  ;
                for(var temp in prderfal.friendName){
                  if(temp==prderfal.searchdata.handle){
                    same = true ;
                    break ;
                  }
                }
                if(same){
                  showToast(context,"Already a friend") ;
                }
                else{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  List<String> friends=[] ;
                  friends.add("${prderfal.searchdata.handle}") ;
                  if(sp.getStringList("friendName")!=null){
                    for(var tem in sp.getStringList("friendName")!){
                      friends.add(tem) ;
                    }
                  }





                  sp.setStringList("friendName", friends!) ;
                  prderfal.addDetails() ;
                  prderfal.addname("${prderfal.searchdata.handle}");
                }
              }
            }),

          ],
        ):SizedBox(),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(onPressed: (){
              prderfal.changesrch(false) ;
              prderfal.removesearchdata() ;

            }, icon: Icon(CupertinoIcons.xmark),
            ),
          ),
    ],
      ),
    );
  }

}