import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/profile/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  final UserType type;

  const ProfileScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return ProfileWidget(type: type);
  }
}
