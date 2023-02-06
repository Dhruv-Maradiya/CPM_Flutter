import 'package:cpm/views/create_student_account/controllers/get_branch_controller.dart';
import 'package:flutter/material.dart';

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

class SelectBranchDropDown extends StatefulWidget {
  const SelectBranchDropDown({super.key});

  @override
  State<SelectBranchDropDown> createState() => _SelectBranchDropDownState();
}

class _SelectBranchDropDownState extends State<SelectBranchDropDown> {
  String dropdownValue = list.first.id.toString();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetBranch().getBranches(context),
      builder: (context, snapshot) {
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
      },
    );
  }
}
