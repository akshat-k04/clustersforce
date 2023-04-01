import 'package:clustersforce/api/userDataApi.dart';
import 'package:clustersforce/models/userDataModel.dart';
import 'package:flutter/cupertino.dart';

class CFuserData with ChangeNotifier {
  bool fetch = false ;
  UserdataModel Mydata = UserdataModel() ;
  List<String> friendName =[] ;
  List<UserdataModel> friendData =[] ;
  UserdataModel searchdata = UserdataModel() ;
  bool searchshow = false ;
  List<UserdataModel> leaderlist =[] ;
  String sorttpye = "Current Rating" ;
  void changesrch(bool a){
    searchshow = a ;
    notifyListeners() ;
  }

  void changefetch(bool a){
    fetch=a ;
    notifyListeners() ;
  }

  Future<void> getmydata (String sper)async{

    var temper = await userApi.getdata(sper) ;
    if(temper.handle=="user_not_exist"){
    }
    else{
      Mydata= temper ;
    }
  }
  void removesearchdata(){
    UserdataModel temperi = UserdataModel() ;
    searchdata= temperi ;
    notifyListeners() ;
  }
  Future<void> searchdatafuc (String sper)async{

    var temper= await userApi.getdata(sper) ;
      searchdata= temper ;
    notifyListeners() ;
  }

  Future<void> getfriendData ()async{
    String names="" ;
    for(var temp in friendName){
      names=names+temp;
      names=names+";";
    }
    if(friendName.length!=0){
      friendData= await userApi.getallData(names) ;
    }
  }



  void addname(String name){
    friendName.add(name) ;
    notifyListeners() ;
  }
  void addDetails (){
    friendData.add(searchdata);
    notifyListeners() ;
  }

  
  void deletename(String name) {
    friendName.remove(name) ;
    notifyListeners() ;
  }
  
  void deleteDetails(UserdataModel data){
    friendData.remove(data) ;
    notifyListeners() ;
  }
  UserdataModel SearchUserData(String handle){
    for(var le in friendData){
      if(le.handle==handle){
        return le ;
      }
    }
    UserdataModel dati = UserdataModel(handle: "User_not_exist") ;
     return dati ;
  }

  void setleaderlist(){
    leaderlist.clear() ;

      for(var lt in friendData){
        leaderlist.add(lt) ;
      }
      leaderlist.add(Mydata) ;
    leaderlist.sort((a,b)=>b.rating!.compareTo(a.rating!)) ;


  }
  void changesort(bool aj){
    //1 = rating
    // 0= max rating
    if(aj){
      leaderlist.sort((a,b)=>b.rating!.compareTo(a.rating!)) ;
      sorttpye = "Current Rating" ;
      notifyListeners() ;
    }
    else{
      leaderlist.sort((a,b)=>b.maxRating!.compareTo(a.maxRating!)) ;
      sorttpye= "Max Rating" ;
      notifyListeners() ;
    }

  }

}


