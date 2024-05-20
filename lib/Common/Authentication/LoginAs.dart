// Importing material design components from Flutter.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Common/Authentication/registerPage.dart';
import 'package:medicare/Doctor/Home/DoctorHomePage.dart';
import 'package:medicare/Patient/Home/PatientHomePage.dart';
import 'package:medicare/Pharmacy/PharmacyHomePage.dart';
import 'package:medicare/Common/Widgets/DialogBox/errorDialog.dart';
import 'package:medicare/Common/Widgets/DialogBox/loadingDialog.dart';
// Importing configuration settings like color schemes from the Medicare project.
import 'package:medicare/Common/config/config.dart';
// Assuming the Medicare config class exists and has the specified properties.

// Defining a StatefulWidget to handle state changes for user type selection.
class WhichUser extends StatefulWidget {
  // Constructor with an optional key parameter.
  const WhichUser({Key? key}) : super(key: key);

  @override
  // Creating the state for this widget.
  State<WhichUser> createState() => _WhichUserState();
}

// Private State class for the WhichUser StatefulWidget.
class _WhichUserState extends State<WhichUser> {
  int currentUser = 0; // Tracks the current user type as an integer.
  List Pages = ["Pharmacist", "Patient", "Doctor"]; // List of user types.
  TextEditingController _email = TextEditingController();
  TextEditingController _id = TextEditingController();

  TextEditingController _passwrod = TextEditingController();
  TextEditingController _doctorPassword = TextEditingController();
  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Medicare.primaryColor,
      body: SafeArea(
        // A widget that inserts its child with enough padding to avoid intrusions.
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centers children horizontally.
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Centers children vertically.
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              width: 45,
                              height: 45,
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
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
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers items in the row.
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                            "images/logo.png"), // Displays the logo image.
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 14),
                      width: 2,
                      height: MediaQuery.of(context).size.height *
                          0.15, // Sets height relative to screen height.
                      color: Medicare.whiteColor, // Sets the color to white.
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Access Your \nAccount", // Display text in the row.
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Login As", // Subheading for the login options.
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centers items in the row.
                  children: [
                    userOption(
                      "Pharmacist",
                      0,
                      "1.pnsdfssg-removebg-preview.png", // Custom image for the Pharmacist option.
                    ),
                    userOption(
                      "Patient",
                      1,
                      "1.pnsdfssg-removebg-preview.png", // Custom image for the Patient option.
                    ),
                    userOption(
                      "Doctor",
                      2,
                      "1.pnsdfssg-removebg-preview.png", // Custom image for the Doctor option.
                    ),
                  ],
                ),
                if (currentUser == 0) ...[
                  Column(
                    children: [
                      const SizedBox(
                        height: 20, // Adds vertical spacing.
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: _id,
                          textAlign: TextAlign
                              .start, // Center align the text inside the TextField
                          style: const TextStyle(
                            color: Colors.white,
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Employee ID', // Hint text that appears in the center

                            hintStyle: const TextStyle(
                              color: Colors.white70, // Style the hint text
                            ),
                            prefixIcon: Image.asset(
                              "images/icons/1.png",
                              width: 50,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          obscureText: true,

                          controller: _doctorPassword,
                          textAlign: TextAlign
                              .start, // Center align the text inside the TextField
                          style: const TextStyle(
                            color: Colors.white,
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Password', // Hint text that appears in the center

                            hintStyle: const TextStyle(
                              color: Colors.white70, // Style the hint text
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size(
                                150,
                                45, // Defines the size of the button.
                              ),
                            ),
                          ),
                          onPressed: () {
                            checkingData(0);
                          }, // Placeholder function for button press.
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Medicare.primaryColor, // Text color.
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
                if (currentUser == 1) ...[
                  Column(
                    children: [
                      const SizedBox(
                        height: 20, // Adds vertical spacing.
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: _email,
                          textAlign: TextAlign
                              .start, // Center align the text inside the TextField
                          style: const TextStyle(
                            color: Colors.white,
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Email', // Hint text that appears in the center

                            hintStyle: const TextStyle(
                              color: Colors.white70, // Style the hint text
                            ),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          obscureText: true,
                          controller: _passwrod,
                          textAlign: TextAlign
                              .start, // Center align the text inside the TextField
                          style: const TextStyle(
                            color: Colors.white,
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Password', // Hint text that appears in the center

                            hintStyle: const TextStyle(
                              color: Colors.white70, // Style the hint text
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size(
                                150,
                                45, // Defines the size of the button.
                              ),
                            ),
                          ),
                          onPressed: () {
                            ValidatingData();
                          }, // Placeholder function for button press.
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Medicare.primaryColor, // Text color.
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Route route = MaterialPageRoute(
                                builder: (_) => RegisterPage());
                            Navigator.push(context, route);
                          },
                          child: const Text(
                            "Don't have an account? Sign Up",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
                if (currentUser == 2) ...[
                  Column(
                    children: [
                      const SizedBox(
                        height: 20, // Adds vertical spacing.
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: _id,
                          textAlign: TextAlign
                              .start, // Center align the text inside the TextField
                          style: const TextStyle(
                            color: Colors.white,
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Employee ID', // Hint text that appears in the center

                            hintStyle: const TextStyle(
                              color: Colors.white70, // Style the hint text
                            ),
                            prefixIcon: Image.asset(
                              "images/icons/1.png",
                              width: 50,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          obscureText: true,

                          controller: _doctorPassword,
                          textAlign: TextAlign
                              .start, // Center align the text inside the TextField
                          style: const TextStyle(
                            color: Colors.white,
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Password', // Hint text that appears in the center

                            hintStyle: const TextStyle(
                              color: Colors.white70, // Style the hint text
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 20,
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.whiteColor,
                                  width: 1.0), // Normal state border
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size(
                                150,
                                45, // Defines the size of the button.
                              ),
                            ),
                          ),
                          onPressed: () {
                            checkingData(2);
                          }, // Placeholder function for button press.
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Medicare.primaryColor, // Text color.
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget function for user options.
  Widget userOption(String title, int userValue, String customImage) {
    bool isSelected =
        currentUser == userValue; // Check if the current user type is selected.
    return GestureDetector(
      onTap: () {
        setState(() {
          currentUser = userValue; // Update the current user type on tap.
          print(Pages[
              currentUser]); // Print the current page title to the console.
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 110,
                padding: const EdgeInsets.all(20),
                color: Medicare
                    .secondaryColor, // Background color for the image container.
                child: Image.asset(
                    "images/$customImage"), // Display the custom image.
              ),
              Container(
                width: 110,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(10),
                color: Medicare
                    .whiteColor, // Background color for the title container.
                child: Text(
                  title,
                  style: TextStyle(
                    color: Medicare.textColor, // Text color.
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center, // Center text alignment.
                ),
              ),
            ],
          ),
          if (isSelected)
            Positioned(
              right: 10, // Position from the right.
              top: 5, // Position from the top.
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green, // Background color for the checkmark.
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(
                      2), // Padding inside the circle for the icon.
                  child: Icon(
                    Icons.check,
                    size: 16, // Size of the check icon.
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Function to display a dialog with a custom message
  displayDialog() {
    showDialog(
      context: context, // Current BuildContext
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside of it
      builder: (c) {
        // Dialog builder
        return const ErrorAlertDialog(
          message: "Fill up the form",
          // Custom dialog widget
        );
      },
    );
  }

  /////////////////////////// Patient Login Function /////////////////////////////

  // Function to handle authentication process
  ValidatingData() async {
    _email.text.isNotEmpty && _passwrod.text.isNotEmpty
        ? _login()
        : displayDialog();
  }

  // Async function to handle Firebase login
  void _login() async {
    showDialog(
        context: context, // Current BuildContext
        builder: (c) {
          // Dialog builder
          return const LoadingAlertDialog(
            // Custom dialog widget for loading state
            message:
                "Authenticating user...", // Message displayed during authentication
          );
        });
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            // Firebase authentication method
            email: _email.text.trim(), // Email from the text field
            password: _passwrod.text.trim()) // Password from the text field
        .then((results) {
      if (results.user?.emailVerified == true) {
        SavingTempData(results.user?.uid);
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (_) => const ErrorAlertDialog(
              message:
                  "A verification link was sent to your email, please Verify your account and login again."),
        );
        results.user?.sendEmailVerification();
      }
    }).catchError(
      // Handling errors during authentication
      (error) {
        Navigator.pop(context); // Close any open dialogs
        showDialog(
          // Show error dialog
          context: context, // Current BuildContext
          builder: (c) => ErrorAlertDialog(
            // Custom error dialog widget
            message: error.toString(), // Error message
          ),
        );
      },
    );
  }

  SavingTempData(String? currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser)
        .get()
        .then((results) async {
      await Medicare.sharedPreferences?.setString(
        "name",
        results.get("name"),
      );
      await Medicare.sharedPreferences?.setString(
        "phoneNumber",
        results.get("phoneNumber"),
      );
      await Medicare.sharedPreferences?.setInt(
        "id",
        results.get("id"),
      );
      Route route = MaterialPageRoute(builder: (_) => PatientHomePage());
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    });
  }

  ///////////////////////////////// Doctor login End ////////////////////////////////

  showingError() {
    showDialog(
      context: context, // Current BuildContext
      barrierDismissible:
          false, // Prevents closing the dialog by tapping outside of it
      builder: (c) {
        // Dialog builder
        return const ErrorAlertDialog(
          message: "Fill up the form",
          // Custom dialog widget
        );
      },
    );
  }

  // Function to handle authentication process
  checkingData(userNumber) async {
    _id.text.isNotEmpty && _doctorPassword.text.isNotEmpty
        ? doctorLogin(userNumber)
        : showingError();
  }

  // Async function to handle Firebase login
  doctorLogin(userNumber) async {
    showDialog(
      context: context, // Current BuildContext
      builder: (c) {
        // Dialog builder
        return const LoadingAlertDialog(
          // Custom dialog widget for loading state
          message:
              "Authenticating user...", // Message displayed during authentication
        );
      },
    );
    validatingData(userNumber);
  }

  validatingData(int userNumber) async {
    var gettingDat = await FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: _id.text.trim())
        .where("password", isEqualTo: _doctorPassword.text.trim())
        .get();

    if (gettingDat.docs.isNotEmpty) {
      String dd = gettingDat.docs[0].id;
      await Medicare.sharedPreferences?.setString(
        "name",
        gettingDat.docs[0]['name'],
      );
      await Medicare.sharedPreferences?.setString(
        "phoneNumber",
        gettingDat.docs[0]['phoneNumber'],
      );
      await Medicare.sharedPreferences?.setString(
        "id",
        gettingDat.docs[0]['id'],
      );

      if (gettingDat.docs[0]['type'] == "doctor" && userNumber == 2) {
        Route route = MaterialPageRoute(builder: (_) => DoctorHomePage());
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
      } else if (gettingDat.docs[0]['type'] == "Pharmacist " &&
          userNumber == 0) {
        Route route = MaterialPageRoute(builder: (_) => PharmacyHomePage());
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (_) => const ErrorAlertDialog(
            message: "Pleaes Make Sure you are the correct User",
          ),
        );
      }
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (_) => const ErrorAlertDialog(
          message: "The Employee ID or The Password is wrong",
        ),
      );
    }
  }
}
