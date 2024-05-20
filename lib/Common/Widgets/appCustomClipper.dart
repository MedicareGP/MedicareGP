// Importing material design components from Flutter to build the user interface.
import 'package:flutter/material.dart';

// Defining a custom clipper class for an AppBar that extends CustomClipper<Path>.
class AppBarCustomClipper extends CustomClipper<Path> {
  @override
  // Method that defines how the path should be clipped.
  Path getClip(Size size) {
    double width =
        size.width; // Captures the width of the widget to be clipped.
    double height =
        size.height; // Captures the height of the widget to be clipped.
    var path = Path(); // Creates a new path object.
    path.lineTo(
        0,
        height -
            72); // Moves from the top left corner to start of the curve on the bottom.
    path.quadraticBezierTo(width / 2, height, width,
        height - 72); // Creates a bezier curve that dips down in the center.
    path.lineTo(width,
        0); // Draws a line from the right end of the curve to the top right corner of the widget.
    path.close(); // Closes the path to connect the end point back to the starting point, completing the shape.
    return path; // Returns the path object, defining the clip shape.
  }

  @override
  // Method to determine if the clipper should redraw its clip when the widget rebuilds.
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; // Always returns true, indicating that the clip should be redrawn on every build.
  }
}
