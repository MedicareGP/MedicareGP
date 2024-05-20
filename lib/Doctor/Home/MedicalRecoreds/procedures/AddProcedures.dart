// Importing material design components from Flutter to build the user interface.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicare/Common/Widgets/DialogBox/loadingDialog.dart';
// Importing a custom app bar widget from the Medicare project.
import 'package:medicare/Common/Widgets/appBar.dart';
// Importing configuration settings like color schemes from the Medicare project.
import 'package:medicare/Common/config/config.dart';

// Defining a StatefulWidget to handle state changes for a lab results application.
class AddProcedures extends StatefulWidget {
  String patientName;
  String patientID;
  String customID;

  AddProcedures(
      {super.key,
      required this.patientID,
      required this.patientName,
      required this.customID});
  @override
  // Creating the state for this widget.
  State<AddProcedures> createState() => _AddProceduresState();
}

// Private State class for handling the dynamic aspects of the AddProcedures screen.
class _AddProceduresState extends State<AddProcedures> {
  final TextEditingController _testNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _findingsController = TextEditingController();
  final TextEditingController _complicationsController =
      TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _performedByController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String doctorID = Medicare.sharedPreferences?.getString("id") ?? "";

  String? selectedUserId;
  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context, "${widget.patientName.split(' ')[0]}'s Procedures", () {
        Navigator.pop(context);
      }), // Adding a custom app bar with the patient's first name and the title "Lab Results".
      backgroundColor: Medicare
          .primaryColor, // Setting the background color of the entire screen to Medicare's primary color.
      body: SingleChildScrollView(
        // A scrolling widget that enables vertical scrolling if the content is too large to fit on the screen.
        child: Column(
          children: [
            const SizedBox(
              height: 40, // Adds a vertical spacing of 40 pixels.
            ),
            Container(
              margin: const EdgeInsets.all(20), // Margin around the container.
              child: Column(
                children: [
                  Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -15),
                        child: Text(
                          "Procedures", // Heading text for the section.
                          style: TextStyle(
                            fontSize: 18, // Font size set to 18.
                            color: Medicare
                                .whiteColor, // Text color set to Medicare's white color.
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(
                        10), // Margin around the inner container.
                    padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 30,
                        bottom: 30), // Padding inside the container.
                    decoration: BoxDecoration(
                      color:
                          Medicare.whiteColor, // Background color set to white.
                      borderRadius: BorderRadius.circular(
                          20), // Rounded corners with a radius of 20.
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _testNameController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField.
                          style: const TextStyle(
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter.
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter.
                            hintText:
                                'Procedures Name', // Hint text that appears in the center.
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text.
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField.
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius.
                              borderSide: BorderSide(
                                color: Medicare
                                    .primaryColor, // Primary color border.
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled.
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width: 1.0), // Normal state border.
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused.
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width:
                                      2.0), // Border when the TextField is focused.
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _findingsController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField.
                          style: const TextStyle(
                            height:
                                1, // Reduces the line height, which effectively makes the TextField shorter.
                            fontSize: 18, // Optionally, set the font size.
                          ),
                          minLines: 1, // Set the initial height.
                          maxLines:
                              null, // Allows the TextField to grow vertically.
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical:
                                  8, // Reduces the vertical padding, making the field shorter.
                              horizontal:
                                  16, // Optionally, increase horizontal padding for more space.
                            ),
                            hintText:
                                'Findings', // Hint text that appears in the center.
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text.
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField.
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius.
                              borderSide: BorderSide(
                                color: Medicare
                                    .primaryColor, // Primary color border.
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled.
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                                width: 1.0, // Normal state border.
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused.
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                                width:
                                    2.0, // Border when the TextField is focused.
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _complicationsController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField.
                          style: const TextStyle(
                            height:
                                1, // Reduces the line height, which effectively makes the TextField shorter.
                            fontSize: 18, // Optionally, set the font size.
                          ),
                          minLines: 1, // Set the initial height.
                          maxLines:
                              null, // Allows the TextField to grow vertically.
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical:
                                  8, // Reduces the vertical padding, making the field shorter.
                              horizontal:
                                  16, // Optionally, increase horizontal padding for more space.
                            ),
                            hintText:
                                'Complications', // Hint text that appears in the center.
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text.
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField.
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius.
                              borderSide: BorderSide(
                                color: Medicare
                                    .primaryColor, // Primary color border.
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled.
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                                width: 1.0, // Normal state border.
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused.
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                                width:
                                    2.0, // Border when the TextField is focused.
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _noteController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField.
                          style: const TextStyle(
                            height:
                                1, // Reduces the line height, which effectively makes the TextField shorter.
                            fontSize: 18, // Optionally, set the font size.
                          ),
                          minLines: 1, // Set the initial height.
                          maxLines:
                              null, // Allows the TextField to grow vertically.
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical:
                                  8, // Reduces the vertical padding, making the field shorter.
                              horizontal:
                                  16, // Optionally, increase horizontal padding for more space.
                            ),
                            hintText:
                                'Note', // Hint text that appears in the center.
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text.
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField.
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius.
                              borderSide: BorderSide(
                                color: Medicare
                                    .primaryColor, // Primary color border.
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled.
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                                width: 1.0, // Normal state border.
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused.
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                                width:
                                    2.0, // Border when the TextField is focused.
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _performedByController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField.
                          style: const TextStyle(
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter.
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter.
                            hintText:
                                'Proceduralist', // Hint text that appears in the center.
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text.
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField.
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius.
                              borderSide: BorderSide(
                                  color: Medicare
                                      .primaryColor), // Primary color border.
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled.
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width: 1.0), // Normal state border.
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused.
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width:
                                      2.0), // Border when the TextField is focused.
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _dateController,
                          textAlign: TextAlign.center, // Center the text.
                          style: const TextStyle(height: 0.8),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                            hintText: 'Select Date',
                            hintStyle: const TextStyle(
                                color: Colors.grey), // Style the hint text.

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Medicare.primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor, width: 2.0),
                            ),
                          ),
                          readOnly: true, // Makes the field read-only.
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  // Defines an ElevatedButton widget which is a type of material design button.
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      ElevatedButton(
                        // Customizes the appearance and layout of the button.
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size(
                              140,
                              50, // Specifies the size of the button as 140 pixels wide by 50 pixels high.
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20, // Sets the border radius of the button to 20, making the edges rounded.
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Medicare
                              .whiteColor), // Sets the background color of the button to white defined in the Medicare config.
                        ),
                        onPressed: () {
                          submitLabResult();
                        }, // Defines the function to execute when the button is pressed.
                        // The content inside the button.
                        child: Text(
                          "Submit", // Text displayed inside the button.
                          style: TextStyle(
                            color: Medicare
                                .primaryColor, // Sets the text color to the primary color defined in the Medicare config.
                            fontWeight: FontWeight.bold, // Makes the text bold.
                            fontSize:
                                16, // Sets the font size of the text to 16.
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> submitLabResult() async {
    if (_testNameController.text.isEmpty ||
        _findingsController.text.isEmpty ||
        _complicationsController.text.isEmpty ||
        _noteController.text.isEmpty ||
        _performedByController.text.isEmpty ||
        _dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      savingData();
    }
  }

  savingData() async {
    String? currentUser = FirebaseAuth.instance.currentUser?.uid;
    showDialog(
      context: context,
      builder: (_) => const LoadingAlertDialog(
        message: "Saving Data",
      ),
    );
    try {
      await FirebaseFirestore.instance.collection('procedures').add({
        "patientID": widget.patientID,
        "patientName": widget.patientName,
        'testName': _testNameController.text,
        'findings': _findingsController.text,
        'complications': _complicationsController.text,
        'note': _noteController.text,
        'performedBy': _performedByController.text,
        "date": _dateController.text,
        "customID": widget.customID,
        "uploadedON": DateTime.now(),
        'doctorID': doctorID,
      });

      // Clear the text fields after successful submission
      _testNameController.clear();
      _findingsController.clear();
      _complicationsController.clear();
      _noteController.clear();
      _performedByController.clear();
      _dateController.clear();
      selectedUserId = null;

      // Show a success message
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully saved.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      Navigator.pop(context);
      // If an error occurs, display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Set initial date to today's date
      firstDate: DateTime.now(), // Set first date to today's date
      lastDate:
          DateTime(2100), // Set last date to a future date, e.g., year 2100
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}
