import 'package:clustersforce/api/contest.dart';
import 'package:flutter/foundation.dart';

import '../models/contestmodel.dart';

class ContestProvid with ChangeNotifier{
  List<ContestModel> ContestList =[] ;
  List<String> IDList=[] ;
  Future<void> fetchContests ()async{
    ContestList =await contestApi.fetchContest() ;
    ContestList.sort((a,b)=> b.second.compareTo(a.second)) ;
    for(var tem in ContestList){
      IDList.add("${tem.id}");
    }
    notifyListeners() ;
  }

  ContestModel searchContestData(String id){
    for(var temp in ContestList){
      if("${temp.id}"==id){
        return temp ;
      }
    }
    ContestModel error =ContestModel(name: "erroe", type: "error", id: 0, second: 0,date: "") ;
    return error ;
  }

}