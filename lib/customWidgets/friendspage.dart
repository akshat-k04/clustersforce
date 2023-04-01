import 'package:clustersforce/customWidgets/FriendTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cfuserdata.dart';

class FriendsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PageState() ;
  }

}

class PageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    CFuserData prder = Provider.of<CFuserData>(context,listen:true);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,
          vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFDDF7E3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
                // spreadRadius: 3,
                blurRadius: 5
            ),
          ]
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: SingleChildScrollView(
                  child: Text("Friends",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30,
                        fontFamily: "ubantu",
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E54AC)),
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.black26,) ,
          (prder.friendData.isEmpty|| prder.friendData.length==0)?const Text("You do not have any friend"):
    ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: prder.friendData.length,
    itemBuilder: (BuildContext context, int index) {
    return FriendTile(rating: '${prder.friendData[index].rating}', contribution: '${prder.friendData[index].contribution}', title: '${prder.friendData[index].handle}', friendcount: '${prder.friendData[index].friendOfCount}', maxrank: '${prder.friendData[index].maxRank}', maxrating: '${prder.friendData[index].maxRating}', photo: '${prder.friendData[index].titlePhoto}', ranking: '${prder.friendData[index].rank}',) ;
    } ,
    ),
    ],
      ),
    ) ;
  }

}