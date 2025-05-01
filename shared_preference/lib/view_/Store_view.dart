import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference/ViewModel/StoreProvider.dart';
import 'package:shared_preference/view_/InputFileTittle.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StoreProvider>(context);
    final size = MediaQuery.of(context).size;
    final primaryColor = Colors.red.withGreen(150).withBlue(100);

    return Scaffold(
      appBar: AppBar(title: const Text("Store Data"), backgroundColor: primaryColor),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputFieldTitle(title: "Name:"),
            TextFormField(controller: vm.nameController),
            const SizedBox(height: 10),
            InputFieldTitle(title: "Interest:"),
            TextFormField(controller: vm.interestController, maxLines: 3),
            const SizedBox(height: 10),
            InputFieldTitle(title: "Age:"),
            Row(
              children: List.generate(20, (index) {
                final age = index + 20;
                return GestureDetector(
                  onTap: () => vm.updateAge(age),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: vm.selectedAge == age ? primaryColor : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('$age'),
                  ),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputFieldTitle(title: "Graduated?"),
                Switch(value: vm.isGraduated, onChanged: (_) => vm.toggleGraduation()),
              ],
            ),
            InputFieldTitle(title: "Favourite Subjects"),
            Wrap(
              children: vm.favouriteSubjects.entries.map((e) {
                return SizedBox(
                  width: size.width / 2.2,
                  child: Row(
                    children: [
                      Checkbox(
                        value: e.value,
                        onChanged: (value) => vm.toggleSubject(e.key, value ?? false),
                      ),
                      Text(e.key),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () => vm.storeData(context),
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                child: vm.isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Store Data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}