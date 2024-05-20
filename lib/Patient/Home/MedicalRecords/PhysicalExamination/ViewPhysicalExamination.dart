// Importing material design components from Flutter to build the user interface.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/Test/addTest.dart';
import 'package:medicare/Doctor/Home/PrescribeMedicatinos/prescribeMedications.dart';
import 'package:medicare/Common/Widgets/appBar.dart';
import 'package:medicare/Common/config/config.dart';

// Defining a StatefulWidget to handle state changes for viewing lab results.
class PatientViewPhysicalExamination extends StatefulWidget {
  PatientViewPhysicalExamination({
    super.key,
  });

  @override
  // Creating the state for this widget.
  State<PatientViewPhysicalExamination> createState() =>
      _PatientViewPhysicalExaminationState();
}

// Private State class for handling the dynamic aspects of the PatientViewPhysicalExamination screen.
class _PatientViewPhysicalExaminationState
    extends State<PatientViewPhysicalExamination> {
  String? currentUser = FirebaseAuth.instance.currentUser?.uid;

  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Physical Examination", () {
        Navigator.pop(context);
      }), // Adding a custom app bar with the title "Lab Results".
      backgroundColor: Medicare
          .primaryColor, // Setting the background color of the entire screen to Medicare's primary color.
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('physicalExamination')
                    .where("patientID", isEqualTo: currentUser)
                    .orderBy("uploadedON", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final data = docs[index].data() as Map<String, dynamic>;
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${data['testName'] ?? ''}',
                                  style: TextStyle(
                                    color: Medicare.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${data['date'] ?? ''}', // Assuming the date is stored in 'date' field
                                  style: const TextStyle(
                                    color: Colors
                                        .grey, // Choose an appropriate color for the date
                                    fontSize:
                                    14, // Adjust the font size for the date if needed
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Result: ${data['description'] ?? ''}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Performed By: ${data['performedBy'] ?? ''}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
