import 'package:flutter/material.dart';

class StatusContainer extends StatelessWidget {
  final String label;
  final bool isDanger;
  const StatusContainer({Key? key, required this.label, required this.isDanger}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,height: 30, width: 20,decoration: BoxDecoration(
        border: Border.all(
          color: isDanger ? Colors.red : Colors.green,
        ),
        color: isDanger ? Colors.red.shade50 : Colors.green.shade50,
        borderRadius: const BorderRadius.all(Radius.circular(20))
    ),child: Text(label, style: TextStyle(color: isDanger ? Colors.red : Colors.green, fontSize: 15),));
  }
}
