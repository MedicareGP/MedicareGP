import 'package:flutter/material.dart';
import 'package:medicare/Common/Widgets/appCustomClipper.dart';
import 'package:medicare/Common/config/config.dart';

// Function that creates a custom app bar widget.
PreferredSizeWidget appBar(
    BuildContext context, String text, VoidCallback onBackPressed) {
  return AppBar(
    leading: Container(),
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
            180, // Setting the height of the container inside the clip path to 145.
        width: MediaQuery.of(context)
            .size
            .width, // Making the container as wide as the screen.
        decoration: BoxDecoration(
          color: Medicare
              .whiteColor, // Setting the background color of the container to white from Medicare config.
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onBackPressed,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Medicare
                            .primaryColor, // Setting the background color to green.
                      ),
                      width: 45,
                      height: 45,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white, // Setting the icon color to white.
                      ),
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        color: Medicare.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                text, // Displaying text inside the app bar.
                style: TextStyle(
                  color: Medicare
                      .primaryColor, // Setting the text color to the primary color from Medicare config.
                  fontSize: 20, // Setting the size of the text to 20.
                  fontWeight: FontWeight.normal, // Making the text normal.
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
