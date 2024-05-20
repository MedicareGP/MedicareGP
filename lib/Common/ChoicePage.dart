// Importing material design components from Flutter to build the user interface.
import 'package:flutter/material.dart';
import 'package:medicare/Common/Authentication/registerPage.dart';
import 'package:medicare/Common/Authentication/LoginAs.dart';
// Importing configuration settings like color schemes from the Medicare project.
import 'package:medicare/Common/config/config.dart';
// Assuming the Medicare config class exists and has the specified properties

// Defining a StatefulWidget to manage state changes for the login and signup interface.
class ChoicePage extends StatefulWidget {
  // Constructor that optionally takes a key and passes it to the parent class.
  const ChoicePage({Key? key}) : super(key: key);

  @override
  // Creating the state for this widget.
  State<ChoicePage> createState() => _ChoicePageState();
}

// Private State class for the ChoicePage StatefulWidget.
class _ChoicePageState extends State<ChoicePage> {
  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Material(
      color: Medicare
          .primaryColor, // Setting the background color of the whole screen.
      child: SafeArea(
        // SafeArea avoids intrusions by the operating system into the app's space.
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, // Making the container fill the screen width.
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centering children horizontally.
            mainAxisAlignment:
                MainAxisAlignment.center, // Centering children vertically.
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Image.asset(
                      "images/logo.png"), // Displaying an image, assumed to be the logo.
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Ensuring the container fills the screen width.
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // Creating a rounded corner on top of the container.
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                    color: Colors
                        .white, // Setting the background color of the container to white.
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centering the buttons vertically.
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size(
                              200,
                              50, // Setting the size of the button.
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                4, // Slightly rounding the corners of the button.
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Medicare
                              .primaryColor), // Button color set to Medicare primary color.
                        ),
                        onPressed: () {
                          Route route =
                              MaterialPageRoute(builder: (_) => WhichUser());
                          Navigator.push(context, route);
                        }, // Placeholder function for what happens when the button is pressed.
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Medicare
                                .whiteColor, // Text color is set to white.
                            fontWeight:
                                FontWeight.bold, // Making the text bold.
                            fontSize: 18, // Setting the font size.
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10, // Adding space between the two buttons.
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size(
                              200,
                              50, // Setting the size of the button.
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                4, // Slightly rounding the corners of the button.
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Medicare
                              .primaryColor), // Button color set to Medicare primary color.
                        ),
                        onPressed: () {
                          Route route =
                              MaterialPageRoute(builder: (_) => RegisterPage());
                          Navigator.push(context, route);
                        }, // Placeholder function for what happens when the button is pressed.
                        child: Text(
                          "SIGNUP",
                          style: TextStyle(
                            color: Medicare
                                .whiteColor, // Text color is set to white.
                            fontWeight:
                                FontWeight.bold, // Making the text bold.
                            fontSize: 18, // Setting the font size.
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
