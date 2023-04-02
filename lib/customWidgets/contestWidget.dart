import 'package:clustersforce/models/contestmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/contestProvider.dart';

class Contest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ContestState() ;
  }

}

class ContestState extends State<Contest>{
  @override
  Widget build(BuildContext context) {
    ContestProvid prdercontest = Provider.of<ContestProvid>(context,listen:false);
    return Container(
      child: Center(
        child: DropdownButton<String>(
          underline: const DropdownButtonHideUnderline(child: SizedBox(),),
          value: "${prdercontest.ContestList[0].id}",
          itemHeight:80 ,
          items: prdercontest.IDList
              .map<DropdownMenuItem<String>>((String value) {
                ContestModel temper =prdercontest.searchContestData(value) ;
            return DropdownMenuItem<String>(

              value: value,
              child: Info(tem: temper,)
            );
          }).toList(),
          onChanged: (String? val){

          },
        ),
      ),
    ) ;
  }


}
class Info extends StatelessWidget{
  ContestModel tem ;
  Info({super.key,required this.tem});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      // width: 20,
      // height: 100,
      constraints: const BoxConstraints(
        maxWidth: 220
      ),
      child: Column(
        children: [
          Text(
            "${tem.name} (${tem.id}), ${tem.type}",
            style: const TextStyle(
                fontSize: 15,
                fontFamily: "ubantu"
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(tem.date,
                style: TextStyle(
                  fontSize: 10
                ),
              ),
            ],
          )
        ],
      ),
    ) ;
  }

}

