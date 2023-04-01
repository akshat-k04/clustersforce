import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cfuserdata.dart';

class LeaderTile extends StatelessWidget{
  String name ;
  String rating ;
  String num ;
  LeaderTile({super.key,required this.rating , required this.name,required this.num});
  @override
  Widget build(BuildContext context) {
    CFuserData prderfal = Provider.of<CFuserData>(context,listen:false);

    return Column(
      children: [
        Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40)) ,
            color:(num=="1")?const Color(0xFFFFDF00):(num=="2")?const Color(0xFFC0C0C0):(num=="3")?const Color(0xFFA97142): Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5
              )
            ]
          ),
          child: Row(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color:(name!=prderfal.Mydata.handle) ?const Color(0xFFABC4AA):const Color(0xFFA9907E),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5
                      )
                    ]
                ),
                child: Center(
                  child: Text(
                    num,
                    style: const TextStyle(
                        fontFamily: "patrick",
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(name,
                  style: const TextStyle(
                    fontSize: 30,
                    // fontWeight: FontWeight.bold,
                    fontFamily: "Patrick"
                  ),
                ),
              ),
              Text("(${rating})",
                style: const TextStyle(
                  fontSize: 20,
                    fontFamily: "Patrick"
                ),
              ) ,
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

}