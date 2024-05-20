// Importing material design components from Flutter to build the user interface.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/Test/addTest.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/allergies/addAllergies.dart';
import 'package:medicare/Doctor/Home/PrescribeMedicatinos/prescribeMedications.dart';
import 'package:medicare/Common/Widgets/appBar.dart';
import 'package:medicare/Common/config/config.dart';

// Defining a StatefulWidget to handle state changes for viewing lab results.
class ViewAllergies extends StatefulWidget {
  final String patientName;
  final String patientID;
  final String customID;

  ViewAllergies({
    super.key,
    required this.patientID,
    required this.patientName,
    required this.customID,
  });

  @override
  // Creating the state for this widget.
  State<ViewAllergies> createState() => _ViewAllergiesState();
}

// Private State class for handling the dynamic aspects of the ViewAllergies screen.
class _ViewAllergiesState extends State<ViewAllergies> {
  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Allergies", () {
        Navigator.pop(context);
      }), // Adding a custom app bar with the title "Lab Results".
      backgroundColor: Medicare
          .primaryColor, // Setting the background color of the entire screen to Medicare's primary color.
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 15,
                        color: Medicare.primaryColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.patientName.split(' ')[0]}'s Allergies",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "ID: ${widget.customID}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  "images/logo.png",
                  width: 80,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('allergies')
                    .where("customID", isEqualTo: widget.customID)
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
                              'Severity of allergy: ${data['description'] ?? ''}',
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
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                    builder: (_) => addAllergies(
                          patientID: widget.patientID,
                          patientName: widget.patientName,
                          customID: widget.customID,
                        ));
                Navigator.push(context, route);
              },
              icon: Icon(
                Icons.add,
                size: 35,
                color: Medicare.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
