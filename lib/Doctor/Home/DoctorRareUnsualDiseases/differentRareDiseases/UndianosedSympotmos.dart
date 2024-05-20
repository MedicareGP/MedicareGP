// Importing material design components from Flutter to build the user interface.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Common/Widgets/DialogBox/loadingDialog.dart';
// Importing a custom app bar widget from the Medicare project.
import 'package:medicare/Common/Widgets/appBar.dart';
// Importing configuration settings like color schemes from the Medicare project.
import 'package:medicare/Common/config/config.dart';

// Defining a StatefulWidget to handle state changes for a pharmacy application that prescribes alternative medications.
class UndianosedSympotmos extends StatefulWidget {
  UndianosedSympotmos({super.key});
  @override
  // Creating the state for this widget.
  State<UndianosedSympotmos> createState() => _UndianosedSympotmosState();
}

// Private State class for handling the dynamic aspects of the UndianosedSympotmos screen.
class _UndianosedSympotmosState extends State<UndianosedSympotmos> {
  final TextEditingController _chief = TextEditingController();
  final TextEditingController _symptoms = TextEditingController();
  final TextEditingController _planOfManagement = TextEditingController();
  final TextEditingController _contactInfo = TextEditingController();
  final TextEditingController _clinicalTrial = TextEditingController();
  final TextEditingController _myOpinion = TextEditingController();

  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Prescribe for Rare Diseases", () {
        Navigator.pop(context);
      }),
      backgroundColor: Medicare.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -15),
                        child: Text(
                          "Undiagnosed Symptoms",
                          style: TextStyle(
                              fontSize: 20,
                              color: Medicare.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 30, bottom: 30),
                    decoration: BoxDecoration(
                      color: Medicare.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _chief,
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 0.8),
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'Chief Complaint',
                            hintStyle: const TextStyle(color: Colors.grey),
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
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _symptoms,
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 0.8),
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'Symptoms',
                            hintStyle: const TextStyle(color: Colors.grey),
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
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _clinicalTrial,
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 0.8),
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'Clinical Trial',
                            hintStyle: const TextStyle(color: Colors.grey),
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
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _planOfManagement,
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 0.8),
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'Plan Of Management',
                            hintStyle: const TextStyle(color: Colors.grey),
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
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _myOpinion,
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 0.8),
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'My Opinion',
                            hintStyle: const TextStyle(color: Colors.grey),
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
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _contactInfo,
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 0.8),
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'Contact Info',
                            hintStyle: const TextStyle(color: Colors.grey),
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
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size(140, 50),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Medicare.whiteColor),
                        ),
                        onPressed: () {
                          submitDisease();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Medicare.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> submitDisease() async {
    if (_chief.text.isEmpty ||
        _symptoms.text.isEmpty ||
        _planOfManagement.text.isEmpty ||
        _contactInfo.text.isEmpty ||
        _clinicalTrial.text.isEmpty ||
        _myOpinion.text.isEmpty) {
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
      await FirebaseFirestore.instance.collection('rareDiseases').add({
        'chiefComplaint': _chief.text.trim(),
        'symptoms': _symptoms.text.trim(),
        'initialDiagnosis': "",
        'planOfManagement': _planOfManagement.text.trim(),
        'treatment': "",
        'contactInfo': _contactInfo.text.trim(),
        'clinicalTrial': _clinicalTrial.text.trim(),
        'myOpinion': _myOpinion.text.trim(),
        'type': 'undianosedSympotmos',
        'uploadedOn': DateTime.now(),
        'addedBy': currentUser,
      });

      // Clear the text fields after successful submission
      _chief.clear();
      _symptoms.clear();
      _planOfManagement.clear();
      _contactInfo.clear();
      _clinicalTrial.clear();

      // Show a success message
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Disease successfully prescribed.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      Navigator.pop(context);
      // If an error occurs, display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to prescribe disease: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
