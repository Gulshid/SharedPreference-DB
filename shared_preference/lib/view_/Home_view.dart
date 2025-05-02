import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  final nameController = TextEditingController();
  static const String KEYNAME = "name";

  var nameValue = 'No Value Saved';

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: nameController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 10.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () async {
              var name = nameController.text.toString();

              var pref = await SharedPreferences.getInstance();
              pref.setString(KEYNAME, name);
            },
            child: Text("Save Now", style: TextStyle(color: Colors.white)),
          ),

          SizedBox(height: 10.h),
          Text(nameValue, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
  
  void getData()async {
  var pref = await SharedPreferences.getInstance();
  var getName = pref.getString(KEYNAME);
  nameValue = getName!;
  setState(() {});
}
}

