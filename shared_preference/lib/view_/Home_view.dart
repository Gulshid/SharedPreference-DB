import 'package:flutter/material.dart';
import 'package:shared_preference/view_/Store_view.dart';
import 'package:shared_preference/view_/get_view.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.red.withGreen(150).withBlue(100);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences Example"), backgroundColor: primaryColor),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const StoreView())),
                child: const Text("Store Data"),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const GetView())),
                child: const Text("Get Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
