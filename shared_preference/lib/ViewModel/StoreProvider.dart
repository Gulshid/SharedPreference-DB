import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preference/Services_/Shared_Preference.dart';


class StoreProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final interestController = TextEditingController();
  int selectedAge = 20;
  bool isGraduated = false;
  bool isLoading = false;

  Map<String, bool> favouriteSubjects = {
    "Business": false,
    "IT": false,
    "Front-end": false,
    "Backend": false,
    "Full stack": false,
    "Mobile app": false,
    "HR": false,
    "Digital Marketing": false,
    "Robotics": false,
    "Cloud Computing": false,
    "Artificial Intelligence": false,
  };

  void updateAge(int age) {
    selectedAge = age;
    notifyListeners();
  }

  void toggleGraduation() {
    isGraduated = !isGraduated;
    notifyListeners();
  }

  void toggleSubject(String subject, bool value) {
    favouriteSubjects[subject] = value;
    notifyListeners();
  }

  Future<void> storeData(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    await Helper.storeName(name: nameController.text);
    await Helper.storeInterest(interest: interestController.text);
    await Helper.storeAge(age: selectedAge);
    await Helper.storeGraduationStatus(value: isGraduated);
    await Helper.storeFavouriteSubjects(
        stringMapData: jsonEncode(favouriteSubjects));

    isLoading = false;
    notifyListeners();
    Navigator.pop(context);
  }
}
