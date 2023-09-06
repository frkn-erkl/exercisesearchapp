import 'package:flutter/material.dart';

class ExerciseListProvider with ChangeNotifier {
    List<Map<dynamic, dynamic>> items = [];
  List<Map<dynamic, dynamic>> filteredItems = [];
  
  String? exerciseTypeParameter;
  String? muscleTypeParameter;


   List<Map<dynamic, dynamic>>? get getItems {
    return items;
  }

   List<Map<dynamic, dynamic>> get getfilteredItems {
    return filteredItems;
  }


  void setItems(List<Map<dynamic, dynamic>> newitems) {
    items = newitems;
     notifyListeners();
  }

  

   void setfilteredItems(List<Map<dynamic, dynamic>> newitems) {
    items = newitems;
     notifyListeners();
  }


  
}
