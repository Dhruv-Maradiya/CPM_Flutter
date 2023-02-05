import 'package:flutter/material.dart';

// const list = [
//   {'id': 1, 'name': 'Computer Engineering', "displayName": "CE"},
//   {'id': 2, 'name': 'Information Technology', "displayName": "IT"}
// ];
List<Branch> list = <Branch>[
  Branch(
    1,
    'Computer Engineering',
    'CE',
  ),
  Branch(
    2,
    'Computer Engineering',
    'CE',
  ),
  Branch(
    3,
    'Computer Engineering',
    'CE',
  )
];

class Branch {
  final int id;
  final String name;
  final String displayName;

  Branch(this.id, this.name, this.displayName);
}

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: const Center(
          child: DropdownButtonExample(),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first.id.toString();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((Branch value) {
        return DropdownMenuItem<String>(
          value: value.id.toString(),
          child: Text(value.displayName),
        );
      }).toList(),
    );
  }
}
