import 'package:clustersforce/models/userDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cfuserdata.dart';

class Inputit extends StatefulWidget{

  TextEditingController controller ;
  String hinter ;
  Inputit({super.key,required this.controller,required this.hinter});

  @override
  State<StatefulWidget> createState() {
    return StateInput() ;
  }

}

class StateInput extends State<Inputit>{
  @override
  Widget build(BuildContext context) {
    return (widget.hinter=="Enter username")?
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration:  const BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
          )
        ],
      ),
      child: TextField(
          controller: widget.controller,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'ubantu'
          ),
        decoration: InputDecoration(

            border: InputBorder.none,
          hintText: widget.hinter
        ),
      ),
      ) :Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Color(0xE0FFFFFF),
        // color: Color(0xFFE9F8F9),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
          )
        ],
      ),

      child: Center(
        child: TextField(
          controller: widget.controller,
          cursorColor: Colors.blueGrey,
          style: const TextStyle(
              fontFamily: "poppins",
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintText: widget.hinter, border: InputBorder.none),
        ),
      ),
    );
  }

}