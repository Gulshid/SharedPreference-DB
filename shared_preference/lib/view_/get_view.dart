import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference/ViewModel/getProvider.dart';
import 'package:shared_preference/view_/InputFileTittle.dart';

class GetView extends StatefulWidget {
  const GetView({super.key});

  @override
  State<GetView> createState() => _GetViewState();
}

class _GetViewState extends State<GetView> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<Getprovider>(context);
    final size = MediaQuery.of(context).size;
    final primaryColor = Colors.red.withGreen(150).withBlue(100);

    return Scaffold(
      appBar: AppBar(title: const Text("Get Data"), backgroundColor: primaryColor),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputFieldTitle(title: "Name:"),
            Text(vm.name),
            InputFieldTitle(title: "Interest:"),
            Text(vm.interest),
            InputFieldTitle(title: "Age:"),
            Text(vm.age),
            InputFieldTitle(title: "Graduated:"),
            Text(vm.isGraduated),
            InputFieldTitle(title: "Favourite Subjects:"),
            vm.favouriteSubjects.isEmpty
                ? const Text("Empty")
                : Wrap(
                    children: vm.favouriteSubjects.entries.map((e) {
                      return SizedBox(
                        width: size.width / 2.2,
                        child: Row(
                          children: [
                            Checkbox(value: e.value, onChanged: (_) {}),
                            Text(e.key),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => vm.clearData(context),
              child: const Text("Remove Data"),
            )
          ],
        ),
      ),
    );
  }
}