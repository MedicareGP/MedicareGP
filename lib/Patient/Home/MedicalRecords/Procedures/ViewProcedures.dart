// Importing material design components from Flutter to build the user interface.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/Test/addTest.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/procedures/AddProcedures.dart';
import 'package:medicare/Common/Widgets/appBar.dart';
import 'package:medicare/Common/config/config.dart';

// Defining a StatefulWidget to handle state changes for viewing lab results.
class PatientViewProcedures extends StatefulWidget {
  PatientViewProcedures({
    super.key,
  });

  @override
  // Creating the state for this widget.
  State<PatientViewProcedures> createState() => _PatientViewProceduresState();
}

// Private State class for handling the dynamic aspects of the PatientViewProcedures screen.
class _PatientViewProceduresState extends State<PatientViewProcedures> {
  String? currentUser = FirebaseAuth.instance.currentUser?.uid;

  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Procedures", () {
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
                    .collection('procedures')
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
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${data['date'] ?? ''}', // Assuming the date is stored in 'date' field
                                  style: TextStyle(
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
                              'Findings: ${data['findings'] ?? ''}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Complications: ${data['complications'] ?? ''}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Note: ${data['note'] ?? ''}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Proceduralist: ${data['performedBy'] ?? ''}',
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
