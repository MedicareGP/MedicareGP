// Importing the Firebase core library to use Firebase services in the app.
import 'package:firebase_core/firebase_core.dart';
// Importing material design components from Flutter to build the user interface.
import 'package:flutter/material.dart';
import 'package:medicare/Patient/Home/PatientHomePage.dart';
import 'package:medicare/Common/ChoicePage.dart';
// Importing a specific screen from the project which handles alternative medication prescriptions at pharmacies.
import 'package:medicare/Common/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Importing configuration options for Firebase specific to the platform the app is running on.
import 'firebase_options.dart';

// Defining the main function as asynchronous because it performs I/O operations such as initializing Firebase.
Future<void> main() async {
  // Ensuring that the Flutter engine is attached to the framework’s binding before any widgets are created.
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing Firebase with default configuration options based on the current platform (iOS, Android, etc.).
  Medicare.sharedPreferences = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Running the MyApp widget, which is the root of the application.
  runApp(const MyApp());
}

// Defining MyApp class as a stateless widget, which means it does not hold any state changes.
class MyApp extends StatelessWidget {
  // Constructor for MyApp, accepting a key and passing it to the superclass.
  const MyApp({super.key});

  @override
  // Overriding the build method to describe the part of the user interface this widget represents.
  Widget build(BuildContext context) {
    // Returning a MaterialApp, a convenience widget that wraps several widgets that are commonly required for material design applications.
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Disabling the debug banner on the app’s UI during development.
      home:
          ChoicePage(), // Setting the home page of the app to the pharmacy prescribe alternative medications screen.
    );
  }
}
