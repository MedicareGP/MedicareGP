// Importing material design components from Flutter to build the user interface.
import 'package:flutter/material.dart';
// Importing a custom clipper to shape the app bar.
import 'package:medicare/Common/Widgets/appCustomClipper.dart';
// Importing configuration settings like color schemes from the Medicare project.
import 'package:medicare/Common/config/config.dart';

// Function that creates a custom app bar widget.
PreferredSizeWidget appBar2(
    BuildContext context, String text, Widget leadingWidget) {
  return AppBar(
    toolbarHeight:
        125, // Setting the height of the toolbar part of the app bar to 125.
    backgroundColor:
        Colors.transparent, // Making the app bar background transparent.
    elevation: 0, // Removing any shadow that might appear under the app bar.
    flexibleSpace: ClipPath(
      clipper:
          AppBarCustomClipper(), // Applying a custom shape to the app bar using AppBarCustomClipper.
      child: Container(
        height:
            145, // Setting the height of the container inside the clip path to 145.
        width: MediaQuery.of(context)
            .size
            .width, // Making the container as wide as the screen.
        decoration: BoxDecoration(
          color: Medicare
              .whiteColor, // Setting the background color of the container to white from Medicare config.
        ),
        child: Transform.translate(
          offset: Offset(0, -12),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leadingWidget,
                SizedBox(width: 8),
                Text(
                  text, // Displaying text inside the app bar.
                  style: TextStyle(
                    color: Medicare
                        .primaryColor, // Setting the text color to the primary color from Medicare config.
                    fontSize: 20, // Setting the size of the text to 20.
                    fontWeight: FontWeight.normal, // Making the text normal.
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
