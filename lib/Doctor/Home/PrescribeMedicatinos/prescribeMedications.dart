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

// Defining a StatefulWidget to handle state changes for a pharmacy application that prescribes alternative medications.
class DoctorPrescribeMedications extends StatefulWidget {
  String patientName;
  String patientID;
  String customeID;

  DoctorPrescribeMedications(
      {super.key,
      required this.patientID,
      required this.patientName,
      required this.customeID});
  @override
  // Creating the state for this widget.
  State<DoctorPrescribeMedications> createState() =>
      _DoctorPrescribeMedicationsState();
}

// Private State class for handling the dynamic aspects of the DoctorPrescribeMedications screen.
class _DoctorPrescribeMedicationsState
    extends State<DoctorPrescribeMedications> {
  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _date = TextEditingController();
  String doctorID = Medicare.sharedPreferences?.getString("id") ?? "";

  String? selectedUserId;
  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Prescriptions", () {
        Navigator.pop(context);
      }), // Adding a custom app bar with the title "Alternative Medication".
      backgroundColor: Medicare
          .primaryColor, // Setting the background color of the entire screen to Medicare's primary color.
      body: SingleChildScrollView(
        // A scrolling widget that enables vertical scrolling if the content is too large to fit on the screen.
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, // Distributes space evenly around the row's children.
              children: [
                // Displays a logo image.
              ],
            ),
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
                          "Prescribe Medications", // Heading text for the section.
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
                        20, // Rounded corners with a radius of 20.
                      ),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          // Text field not fully shown, but intended for inputting data.
                          controller: _medicineNameController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField
                          style: const TextStyle(
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Enter Medicine Name', // Hint text that appears in the center
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                              ), // Red border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width:
                                      2.0), // Border when the TextField is focused
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _dosageController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField
                          style: const TextStyle(
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Enter Dosage ', // Hint text that appears in the center
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor), // Red border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width:
                                      2.0), // Border when the TextField is focused
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _reasonController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField
                          style: const TextStyle(
                            height:
                                1, // Reduces the line height, which effectively makes the TextField shorter
                            fontSize: 18, // Optionally, set the font size
                          ),
                          minLines: 1, // Set the initial height
                          maxLines:
                              null, // Allows the TextField to grow vertically
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical:
                                  8, // Reduces the vertical padding, making the field shorter
                              horizontal:
                                  16, // Optionally, increase horizontal padding for more space
                            ),
                            hintText:
                                'Enter Reason', // Hint text that appears in the center
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius
                              borderSide: BorderSide(
                                color: Medicare
                                    .primaryColor, // Primary color border
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                                width: 1.0, // Normal state border
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused
                              borderSide: BorderSide(
                                color: Medicare.primaryColor,
                                width:
                                    2.0, // Border when the TextField is focused
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _date,
                          textAlign: TextAlign.center, // Center the text
                          style: const TextStyle(height: 0.8),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                            hintText: 'Select Date',
                            hintStyle: TextStyle(
                                color: Colors.grey), // Style the hint text

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
                          readOnly: true, // Makes the field read-only
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _durationController,
                          textAlign: TextAlign
                              .center, // Center align the text inside the TextField
                          style: const TextStyle(
                            height:
                                0.8, // Reduces the line height, which effectively makes the TextField shorter
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical:
                                    8), // Reduces the vertical padding, making the field shorter
                            hintText:
                                'Enter Duration', // Hint text that appears in the center
                            hintStyle: const TextStyle(
                              color: Colors.grey, // Style the hint text
                            ),
                            border: OutlineInputBorder(
                              // Creates a border around the TextField
                              borderRadius: BorderRadius.circular(
                                  30), // Adds border radius
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor), // Red border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is enabled
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width: 1.0), // Normal state border
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Consistent border radius when the field is focused
                              borderSide: BorderSide(
                                  color: Medicare.primaryColor,
                                  width:
                                      2.0), // Border when the TextField is focused
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // StreamBuilder<QuerySnapshot>(
                        //   stream: FirebaseFirestore.instance
                        //       .collection('users')
                        //       .where("type", isEqualTo: "patient")
                        //       .snapshots(),
                        //   builder: (context, snapshot) {
                        //     if (!snapshot.hasData) {
                        //       return const CircularProgressIndicator(); // Loading indicator while the data is fetching
                        //     }

                        //     List<DropdownMenuItem<String>> userItems =
                        //         snapshot.data!.docs
                        //             .map((doc) => DropdownMenuItem<String>(
                        //                   value: doc
                        //                       .id, // Assuming the document ID is what you want to store as the value
                        //                   child: Text(doc[
                        //                       'name']), // Assuming 'name' is a field in the document
                        //                 ))
                        //             .toList();

                        //     return DropdownButtonFormField<String>(
                        //       value: selectedUserId,
                        //       decoration: InputDecoration(
                        //         contentPadding: const EdgeInsets.symmetric(
                        //             vertical: 8, horizontal: 10),
                        //         hintText: 'Select User',
                        //         hintStyle: const TextStyle(color: Colors.grey),
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(30),
                        //           borderSide: BorderSide(
                        //               color: Medicare
                        //                   .primaryColor), // Adjust color accordingly
                        //         ),
                        //         enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(30),
                        //           borderSide: BorderSide(
                        //               color: Medicare.primaryColor,
                        //               width: 1.0), // Adjust color accordingly
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(30),
                        //           borderSide: BorderSide(
                        //               color: Medicare.primaryColor,
                        //               width: 2.0), // Adjust color accordingly
                        //         ),
                        //       ),
                        //       onChanged: (String? newValue) {
                        //         setState(() {
                        //           selectedUserId = newValue;
                        //         });
                        //       },
                        //       items: userItems,
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  // Defines an ElevatedButton widget which is a type of material design button.
                  Column(
                    children: [
                      // Other widgets above the button
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
                          submitMedication();
                        }, // Defines the function to execute when the button is pressed. Currently, it does nothing.
                        // The content inside the button.
                        child: Text(
                          "Submit", // Text displayed inside the button.
                          style: TextStyle(
                            color: Medicare
                                .primaryColor, // Sets the text color to the primary color defined in the Medicare config.
                            fontWeight: FontWeight.bold, // Makes the text bold.
                            fontSize:
                                16, // Sets the font size of the text to 18.
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

  Future<void> submitMedication() async {
    if (_medicineNameController.text.isEmpty ||
        _dosageController.text.isEmpty ||
        _reasonController.text.isEmpty ||
        _durationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields and select a user.'),
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
      await FirebaseFirestore.instance.collection('medications').add({
        "patientID": widget.patientID,
        "patientName": widget.patientName,
        'medicineName': _medicineNameController.text,
        'dosage': _dosageController.text,
        'reason': _reasonController.text,
        "date": _date.text,
        "customeID": widget.customeID,
        "uploadedON": DateTime.now(),
        'doctorID': doctorID,
        'duration': _durationController.text,
      });

      // Clear the text fields after successful submission
      _medicineNameController.clear();
      _dosageController.clear();
      _reasonController.clear();
      _durationController.clear();
      selectedUserId = null;

      // Show a success message
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Medication successfully prescribed.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      Navigator.pop(context);
      // If an error occurs, display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to prescribe medication: $e'),
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
        _date.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}
