import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DataPage extends StatelessWidget{
  String title;
  String rating ;
  String ranking ;
  String maxrating ;
  String maxrank ;
  String contribution ;
  String friendcount ;
  String photo ;
  DataPage({super.key,required this.rating,required this.contribution,required this.title,required this.friendcount,required this.maxrank,required this.maxrating,required this.photo,required this.ranking});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,
          vertical: 20),
      // width: 320,
      height: 430,

      decoration: const BoxDecoration(
          color: Color(0xFFE8E2E2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFAEC2B6),
                // spreadRadius: 3,
                blurRadius: 5
            )
          ]
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Text(title,
                    style: const TextStyle(
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
          const SizedBox(
            height: 10,
          ),

          Texting(ster: "Current Rating: ${rating}") ,
          Texting(ster: "Max Rating: ${maxrating}") ,
          Texting(ster: "Current Rank: ${ranking}") ,
          Texting(ster: "Max rank: ${maxrank}") ,
          Texting(ster: "Contribution: ${contribution}"),
          Texting(ster: "Friend of: ${friendcount}") ,
          Expanded(child: SizedBox()) ,
          SizedBox(
            height: 130,
            width: 130,
            child: Image.network(photo),
          )
        ],
      ),
    );
  }
}

class Texting extends StatelessWidget{
  String ster ;
  Texting({super.key,required this.ster});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        Row(

          children: [
            Text(ster ,
            style: TextStyle(
              fontFamily: "montserrat"
            ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    ) ;
  }
  
}