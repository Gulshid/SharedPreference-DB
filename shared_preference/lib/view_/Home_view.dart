// ignore_for_file: camel_case_types

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
  final rollController = TextEditingController();
  final emailController = TextEditingController();
  final marksController = TextEditingController();
  final cgpaController = TextEditingController();
  final uniController = TextEditingController();

  static const String KEYNAME = "name";
  static const String KEYROLL = "RollNo";
  static const String KEYMARKS = "Marks";
  static const String KEYEMAIL = "Email";
  static const String KEYCgpa = "CGPA";
  static const String KEYUni = "University";

  var nameValue = 'No Value Saved';
  var rollValue = "No Value Saved";
  var marksValue = "No Value Saved";
  var cgpaValue = "No Value Saved";
  var uniValue = "No Value Saved";
  var emailValue = "No Value Saved";

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
        
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: rollController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your rollNo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: marksController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your Marks',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: cgpaController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your CGPA',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: uniController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your University',
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
                var roll = rollController.text.toString();
                var marks = marksController.text.toString();
                var email = emailController.text.toString();
                var cgpa = cgpaController.text.toString();
                var uni = uniController.text.toString();
        
                var pref = await SharedPreferences.getInstance();
                pref.setString(KEYNAME, name);
                pref.setInt(KEYROLL, roll.toString() as int);
                pref.setInt(KEYMARKS, marks.toString() as int);
                pref.setString(KEYEMAIL, email.toString());
                pref.setDouble(KEYCgpa, cgpa.toString() as double);
                pref.setString(KEYUni, uni.toString());
              },
              child: Text("Save Now", style: TextStyle(color: Colors.white)),
            ),
        
            SizedBox(height: 10.h),
            Text(nameValue, style: TextStyle(color: Colors.black)),
            SizedBox(height: 10.h,),
            Text(rollValue, style: TextStyle(color: Colors.black)),
            SizedBox(height: 10.h,),
            Text(marksValue, style: TextStyle(color: Colors.black)),
            SizedBox(height: 10.h,),
            Text(cgpaValue, style: TextStyle(color: Colors.black)),
            SizedBox(height: 10.h,),
            Text(emailValue, style: TextStyle(color: Colors.black)),
            SizedBox(height: 10.h,),
            Text(uniValue, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  void getData() async {
    var pref = await SharedPreferences.getInstance();
    var getName = pref.getString(KEYNAME);
    var getroll = pref.getInt(KEYROLL);
    var getmarks = pref.getInt(KEYMARKS);
    var getemail= pref.getString(KEYEMAIL);
    var getcgpa = pref.getDouble(KEYCgpa);
    var getuni = pref.getString(KEYUni);
    nameValue = getName!;
    rollValue = getroll.toString();
    marksValue = getmarks.toString();
    emailValue = getemail!;
    cgpaValue = getcgpa.toString();
    uniValue = getuni!;

    setState(() {});
    setState(() {});
    setState(() {});
    setState(() {});
    setState(() {});
    setState(() {});
  }
}
