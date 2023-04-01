import 'dart:convert';

import '../models/userDataModel.dart';
import 'package:http/http.dart' as http;

class userApi {
  static String baseurl = "https://codeforces.com/api/user.info?handles=" ;
  static Future<UserdataModel> getdata(String name)async{
    String ster = baseurl + name ;
    Uri requestUri = Uri.parse(ster) ;
    var response = await http.get(requestUri) ;
    var decod = jsonDecode(response.body);
    UserdataModel data= UserdataModel() ;
    // print(decoded) ;
    var decoded = decod["result"] ;
    if(decod["status"]=="FAILED"){
      data.handle="user_not_exist" ;
      return data ;
    }
    data.rating= decoded[0]["rating"] ;
    // print(decoded.runtimeType) ;
    data.rank= decoded[0]["rank"] ;
    data.maxRating=decoded[0]["maxRating"] ;
    data.maxRank= decoded[0]["maxRank"] ;
    data.handle= decoded[0]["handle"] ;
    data.titlePhoto=decoded[0]["titlePhoto"] ;
    data.friendOfCount= decoded[0]["friendOfCount"] ;
    data.contribution = decoded[0]["contribution"] ;
    return data ;
  }

  static Future<List<UserdataModel>> getallData(String name)async{
    Uri requestUri = Uri.parse("${baseurl+name}") ;
    print("${baseurl+name}") ;
    var response = await http.get(requestUri) ;
    var deco = jsonDecode(response.body);
    var decoder = deco["result"] ;
    List<UserdataModel> dat= [] ;
    for(var decoded in decoder){
      UserdataModel data = UserdataModel() ;
      data.rating= decoded["rating"] ;
      data.rank= decoded["rank"] ;
      data.maxRating=decoded["maxRating"] ;
      data.maxRank= decoded["maxRank"] ;
      data.handle= decoded["handle"] ;
      data.titlePhoto=decoded["titlePhoto"] ;
      data.friendOfCount= decoded["friendOfCount"] ;
      data.contribution = decoded["contribution"] ;
      dat.add(data) ;
    }
    return dat ;
  }
}