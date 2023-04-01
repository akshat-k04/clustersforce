import 'dart:convert';

import '../models/contestmodel.dart';
import 'package:http/http.dart' as http;

class contestApi{


  static Future<List<ContestModel>> fetchContest() async{
  List<ContestModel> contestlist =[] ;
  Uri requestUri = Uri.parse("https://codeforces.com/api/contest.list") ;
  var response = await http.get(requestUri) ;
  var decode = jsonDecode(response.body) ;
  if(decode["status"]=="OK"){
    var decoder = decode["result"] ;
    for(var letter in decoder){
      if(letter["relativeTimeSeconds"]<0){
        ContestModel temp = ContestModel(name:letter["name"], type: letter["type"], id: letter["id"], second: letter["relativeTimeSeconds"]);
        contestlist.add(temp) ;
      }
      else {
        break ;
      }
    }
  }
  else {
    ContestModel con = ContestModel(name: "error", type: 'error', id: 0, second: 0) ;
    contestlist.clear() ;
    contestlist.add(con) ;
  }
    return contestlist ;
}
}