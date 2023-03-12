import 'package:flutter/widgets.dart';
import 'package:projectify/views/task_details/widgets/task_details_widget.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return TaskDetailsWidget();
  }
}
