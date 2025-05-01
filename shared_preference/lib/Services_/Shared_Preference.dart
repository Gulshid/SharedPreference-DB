// ignore_for_file: unused_import
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static late SharedPreferences _prefs;

  static Future initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static clearSharedPreferences() {
    _prefs.clear();
  }

  static storeName({required String name}) async {
    await _prefs.setString("name", name);
  }

  static String? getName() {
    return _prefs.getString("name");
  }

  static storeInterest({required String interest}) async {
    await _prefs.setString("interest", interest);
  }

  static String? getInterest() {
    return _prefs.getString("interest");
  }

  static storeAge({required int age}) {
    _prefs.setInt("age", age);
  }

  static int? getAge() {
    return _prefs.getInt("age");
  }

  static storeGraduationStatus({required bool value}) async {
    await _prefs.setBool("graduationStatus", value);
  }

  static bool? getGraduatedStatus() {
    return _prefs.getBool("graduationStatus");
  }

  static storeFavouriteSubjects({required String stringMapData}) async {
    await _prefs.setString("favouriteSubjects", stringMapData);
  }

  static String? getFavouriteSubjects() {
    return _prefs.getString("favouriteSubjects");
  }
}