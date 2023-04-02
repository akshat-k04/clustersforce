import 'dart:convert';

import '../models/contestmodel.dart';
import 'package:http/http.dart' as http;

class contestApi{

  static String Func(int second){

    if(second<0){
      second*=(-1) ;
    }
    int hr = (second/3600).round()  ;
    if(second%3600>=1800){
      hr-- ;
    }
    second-=(hr*3600) ;
    int min=(second/60).round() ;
    DateTime Date = DateTime.now() ;
    int presenthour = Date.hour ;
    int presentmin = Date.minute ;
    int contesthr = presenthour+hr ;
    int contestmin = presentmin+min ;
    int td=(contestmin/60).round()  ;
    if(contestmin%60>=30){
      td-- ;
    }
    contesthr+= td;
    contestmin-= (td*60) ;
    if(contesthr<24){
      return "start at ${contesthr}:${contestmin} Today" ;
    }
    else{
      if(contesthr<48){
        return "start at ${contesthr-24}:${contestmin} Tomorrow" ;
      }
      else {
        int fg = ((contesthr-(contesthr%24))/24).round() ;
        return "${fg} days left" ;
      }
    }
    return "" ;
  }
  static Future<List<ContestModel>> fetchContest() async{
  List<ContestModel> contestlist =[] ;
  Uri requestUri = Uri.parse("https://codeforces.com/api/contest.list") ;
  var response = await http.get(requestUri) ;
  var decode = jsonDecode(response.body) ;
  if(decode["status"]=="OK"){
    var decoder = decode["result"] ;
    for(var letter in decoder){
      if(letter["relativeTimeSeconds"]<0){
        ContestModel temp = ContestModel(name:letter["name"], type: letter["type"], id: letter["id"], second: letter["relativeTimeSeconds"],date: Func(letter["relativeTimeSeconds"]));
        contestlist.add(temp) ;
      }
      else {
        break ;
      }
    }
  }
  else {
    ContestModel con = ContestModel(name: "error", type: 'error', id: 0, second: 0,date: "") ;
    contestlist.clear() ;
    contestlist.add(con) ;
  }
    return contestlist ;
}
}