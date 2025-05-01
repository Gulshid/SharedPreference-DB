import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preference/Services_/Shared_Preference.dart';


class Getprovider extends ChangeNotifier {
  String name = "Empty";
  String interest = "Empty";
  String age = "Empty";
  String isGraduated = "Empty";
  Map<String, dynamic> favouriteSubjects = {};

  Future<void> loadData() async {
    name = Helper.getName() ?? "Empty";
    interest = Helper.getInterest() ?? "Empty";
    age = Helper.getAge()?.toString() ?? "Empty";
    isGraduated = Helper.getGraduatedStatus()?.toString() ?? "Empty";
    var favSubjectsJson = Helper.getFavouriteSubjects();
    favouriteSubjects =
        favSubjectsJson != null ? jsonDecode(favSubjectsJson) : {};
    notifyListeners();
  }

  void clearData(BuildContext context) {
    Helper.clearSharedPreferences();
    Navigator.pop(context);
  }
}
