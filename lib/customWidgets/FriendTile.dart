import 'package:clustersforce/customWidgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/cfuserdata.dart';
import 'customDataPage.dart';

class FriendTile extends StatefulWidget{
  String title;
  String rating ;
  String ranking ;
  String maxrating ;
  String maxrank ;
  String contribution ;
  String friendcount ;
  String photo ;
  FriendTile({super.key,required this.rating,required this.contribution,required this.title,required this.friendcount,required this.maxrank,required this.maxrating,required this.photo,required this.ranking});


  @override
  State<StatefulWidget> createState() {
    return StateTile() ;
  }

}
class StateTile extends State<FriendTile>{
  bool show= false  ;
  bool done =false ;
  @override
  Widget build(BuildContext context) {
    CFuserData prderfal = Provider.of<CFuserData>(context,listen:false);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFFC7E8CA),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                show= !show ;
                done= false ;
              });
            },
            child: Container(

              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal ,
                      child: Text(widget.title,
                        style: const TextStyle(
                          fontSize: 23,
                          fontFamily: "montserrat",
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  // Expanded(child: SizedBox()),
                  (!show)?Text("(${widget.ranking})",
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "lasitana",
                        fontWeight: FontWeight.bold
                    ),
                  ):const SizedBox(),
                ],
              ),

            ),
          ),
          AnimatedContainer(
            height: (show)?350:0,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn,
            onEnd: (){
              setState(() {
                done= true ;
              });
            },
            child: Column(
              children: [
                (show&& done)?Texting(ster: "Current Rating: ${widget.rating}"):SizedBox() ,
                (show&& done)?Texting(ster: "Max Rating: ${widget.maxrating}"):SizedBox() ,
                (show&& done)?Texting(ster: "Current Rank: ${widget.ranking}"):SizedBox() ,
                (show&& done)?Texting(ster: "Max rank: ${widget.maxrank}") :SizedBox(),
                (show&& done)?Texting(ster: "Contribution: ${widget.contribution}"):SizedBox(),
                (show&& done)?Texting(ster: "Friend of: ${widget.friendcount}") :SizedBox(),
                (show&& done)?Expanded(child: SizedBox()):SizedBox() ,
                (show&& done)?SizedBox(
                  height: 130,
                  width: 130,
                  child: Image.network(widget.photo),
                ):const SizedBox(),
                (show&& done)?const SizedBox(
                  height: 10,
                ):SizedBox(),
                (show&& done)?ClickMe(title: "Remove As A Friend", doing: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  var frind = sp.getStringList("friendName") ;
                  frind?.remove(widget.title);
                  if(frind==null || frind?.length==0){
                    sp.remove("friendName") ;
                  }
                  else{
                    sp.setStringList("friendName", frind) ;
                  }
                  prderfal.deletename(widget.title) ;
                  prderfal.deleteDetails(prderfal.SearchUserData(widget.title)) ;

                }):const SizedBox()
              ],
            ),
          ),
        ],
      ),
    ) ;
  }

}