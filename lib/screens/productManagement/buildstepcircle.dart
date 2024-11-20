import 'package:flutter/material.dart';

class BuildStepCircle extends StatelessWidget {
  final int iscompleted;
  final int active;
  const BuildStepCircle(
      {super.key, required this.iscompleted, required this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildStepCircle("General", 01, active == 0 ? true : false,
            iscompleted == 1 || iscompleted == 2 ? true : false),
        buildStepDivider(),
        buildStepCircle("Details", 02, active == 1 ? true : false,
            iscompleted == 2 || iscompleted == 3 ? true : false),
        buildStepDivider(),
        buildStepCircle("Files", 03, active == 2 ? true : false,
            iscompleted == 3 ? true : false),
      ],
    );
  }

  Widget buildStepCircle(
      String title, int stepNumber, bool isActive, bool completed) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor:
              isActive ? const Color(0xFF5D2E17) : Colors.grey[300],
          foregroundColor: isActive
              ? Colors.white
              : const Color.fromARGB(255, 140, 136, 136),
          child: completed
              ? const Icon(
                  Icons.check_circle, // Tick icon
                  color: Colors.green, // Change color if needed
                )
              : Text(
                  "0$stepNumber",
                  style: const TextStyle(fontSize: 12),
                ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: isActive
                ? Colors.black
                : const Color.fromARGB(255, 140, 136, 136),
          ),
        ),
        const SizedBox(width: 2),
      ],
    );
  }

  // Helper method to build the divider between steps
  Widget buildStepDivider() {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 3, 0),
      child: Row(
        children: [
          Container(
            height: 2,
            color: Colors.grey[300],
            width: 37,
          ),
          Icon(
            Icons.arrow_forward_ios, // Right arrow icon
            size: 10, // Size of the arrow
            color: Colors.grey[500], // Light grey color
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
