// Importing material design components from Flutter to build the user interface.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/Doctor/Home/PrescribeMedicatinos/prescribeMedications.dart';
import 'package:medicare/Common/Widgets/appBar.dart';
import 'package:medicare/Common/config/config.dart';
import 'package:medicare/Pharmacy/Home/AlternativeMediciations/AlternativePrescribeMedications.dart';

// Defining a StatefulWidget to handle state changes for a pharmacy application that prescribes alternative medications.
class AllAlternativePrescribedMedications extends StatefulWidget {
  final String patientName;
  final String patientID;
  final String customeID;

  AllAlternativePrescribedMedications({
    super.key,
    required this.patientID,
    required this.patientName,
    required this.customeID,
  });

  @override
  // Creating the state for this widget.
  State<AllAlternativePrescribedMedications> createState() =>
      _AllAlternativePrescribedMedicationsState();
}

// Private State class for handling the dynamic aspects of the AllAlternativePrescribedMedications screen.
class _AllAlternativePrescribedMedicationsState
    extends State<AllAlternativePrescribedMedications> {
  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Prescriptions", () {
        Navigator.pop(context);
      }), // Adding a custom app bar with the title "Alternative Medication".
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
                          "${widget.patientName.split(' ')[0]}'s Medications",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "ID: ${widget.customeID}",
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
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('medications')
                        .where("customeID", isEqualTo: widget.customeID)
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
                        shrinkWrap: true,
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final data =
                              docs[index].data() as Map<String, dynamic>;
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${data['medicineName'] ?? ''}',
                                      style: TextStyle(
                                        color: Medicare.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                        width:
                                            8), // Add some spacing between the medicine name and the date
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
                                  'Dosage: ${data['dosage'] ?? ''}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Purpose: ${data['reason'] ?? ''}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Duration: ${data['duration'] ?? ''}',
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
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => AlternativePrescribeMedications(
                              patientID: widget.patientID,
                              patientName: widget.patientName,
                              customeID: widget.customeID,
                            ));
                    Navigator.push(context, route);
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 35,
                            color: Medicare.primaryColor,
                          ),
                        ),
                        const Text(
                          "Prescribe Alternative\n Medications",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
