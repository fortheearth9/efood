import 'package:flutter/material.dart';

class IconItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color backgroundColor;
  final VoidCallback onPressed;

  IconItem({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensure the column takes minimum space
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: Colors.black), // Rectangular border
              borderRadius:
                  BorderRadius.circular(4.0), // Slightly rounded corners
            ),
            child: icon,
          ),
          SizedBox(height: 4.0),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis, // Handle overflow text
              style: TextStyle(
                fontWeight: FontWeight.bold, // Bold font
                fontSize: 12.0, // Adjusted font size for better fit
              ),
            ),
          ),
        ],
      ),
    );
  }
}
