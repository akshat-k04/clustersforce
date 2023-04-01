import 'package:clustersforce/customWidgets/Leaderboardtile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cfuserdata.dart';

class leaderBoard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return leaderState() ;
  }

}
class leaderState extends State<leaderBoard> {
  // String sortig = "Current Rating" ;
  @override
  Widget build(BuildContext context) {
    CFuserData prder = Provider.of<CFuserData>(context, listen: true);
    CFuserData prderfal = Provider.of<CFuserData>(context, listen: false);

    return Scaffold(
      body: Container(
        // padding:const EdgeInsets.all(20),
        color: const Color(0xFFFFF2CC),
        child: Column(
          children: [
            const SizedBox(
              height: 140,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Leaderboard",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: "poppins",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: Container(
                  height: 50,
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25) ,
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      underline: const DropdownButtonHideUnderline(child: SizedBox(),),
                      value: prder.sorttpye,

                      items: <String>["Current Rating","Max Rating"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontSize: 20,
                              fontFamily: "ubantu"
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? val){
                        if(val=="Current Rating"){
                          prderfal.changesort(true) ;
                        }
                        else{
                          prderfal.changesort(false) ;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric( vertical: 30),
                // width: 100,
                decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          // spreadRadius: 3,
                          blurRadius: 5),
                    ]),
                child: SingleChildScrollView(
                  child: Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: prder.leaderlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return LeaderTile(name: "${prder.leaderlist[index].handle}", rating: (prder.sorttpye=="Current Rating")?'${prder.leaderlist[index].rating}':'${prder.leaderlist[index].maxRating}',num: "${index+1}",);
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
