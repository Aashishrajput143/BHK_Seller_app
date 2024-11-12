import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6D4530),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  4.0), // Rectangular shape with slightly rounded corners
            ),
            textStyle: const TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
          child: const Row(
            children: [
              Icon(Icons.sort, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                "SORT",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6D4530),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  4.0), // Rectangular shape with slightly rounded corners
            ),
            textStyle: const TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
          child: const Row(
            children: [
              Text(
                "CATEGORIES",
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_drop_down, color: Colors.white, size: 18),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6D4530),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  4.0), // Rectangular shape with slightly rounded corners
            ),
            textStyle: const TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
          child: const Row(
            children: [
              Text(
                "GENDER",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_drop_down, color: Colors.white, size: 18),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6D4530),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  4.0), // Rectangular shape with slightly rounded corners
            ),
            textStyle: const TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
          child: const Row(
            children: [
              Icon(Icons.filter_list, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                "FILTERS",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
