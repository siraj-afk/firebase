import 'package:flutter/material.dart';
class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         ListView.builder(
             itemCount: 5,
             itemBuilder: (BuildContext context, int index) {
               return ListTile(
                   leading: const Icon(Icons.list),
                   trailing: const Text(
                     "GFG",
                     style: TextStyle(color: Colors.green, fontSize: 15),
                   ),
                   title: Text("List item $index"));
             }),
       ],
     ),
    );
  }
}
