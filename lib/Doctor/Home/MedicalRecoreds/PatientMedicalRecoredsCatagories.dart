// Importing material design components from Flutter to build the user interface.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/Test/viewTests.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/allergies/ViewAllergies.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/immunizations/ViewImmunizations.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/physicalExamination/ViewPhysicalExamination.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/procedures/ViewProcedures.dart';
import 'package:medicare/Doctor/Home/PrescribeMedicatinos/AllPrescribedMedications.dart';
// Importing a custom app bar widget from the Medicare project.
import 'package:medicare/Common/Widgets/appBar.dart';
// Importing a custom clipper for stylistic container shaping.
import 'package:medicare/Common/Widgets/appCustomClipper.dart';
// Importing configuration settings like color schemes from the Medicare project.
import 'package:medicare/Common/config/config.dart';

// Defining a StatefulWidget to handle state changes for the DoctorMediclRecordsaCatagories.
class DoctorMediclRecordsaCatagories extends StatefulWidget {
  final String patientName;
  final String patientID;
  final String customeID;

  DoctorMediclRecordsaCatagories({
    super.key,
    required this.customeID,
    required this.patientID,
    required this.patientName,
  });

  @override
  // Creating the state for this widget.
  State<DoctorMediclRecordsaCatagories> createState() =>
      _DoctorMediclRecordsaCatagoriesState();
}

// Private State class for handling the dynamic aspects of the DoctorMediclRecordsaCatagories.
class _DoctorMediclRecordsaCatagoriesState
    extends State<DoctorMediclRecordsaCatagories> {
  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Medical Records", () {
        Navigator.pop(context);
      }),
      backgroundColor: Medicare.primaryColor,
      body: SingleChildScrollView(
        child: Column(
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
                            "${widget.patientName.split(' ')[0]}'s Medical Records",
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
            Column(
              children: [
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => AllPrescribedMedications(
                              patientID: widget.patientID,
                              patientName: widget.patientName,
                              customeID: widget.customeID,
                            ));
                    Navigator.push(context, route);
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: const Color(0xffcbf5fe),
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/icons/17.png",
                              width: 55,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Prescriptions",
                              style: TextStyle(
                                fontSize: 13,
                                color: Medicare.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                          title: Text(
                            "Amoxicillin 500gm",
                            style: TextStyle(
                              fontSize: 13,
                              color: Medicare.primaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: const Text(
                            "Recorded",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffd1d2d2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => ViewAllergies(
                              patientID: widget.patientID,
                              patientName: widget.patientName,
                              customID: widget.customeID,
                            ));
                    Navigator.push(context, route);
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: const Color(0xffcbf5fe),
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Medicare.primaryColor,
                                BlendMode.srcATop,
                              ),
                              child: Image.asset(
                                "images/icons/9.png",
                                width: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Allergies",
                              style: TextStyle(
                                fontSize: 13,
                                color: Medicare.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                          title: Text(
                            "Penicillin Allergy",
                            style: TextStyle(
                              fontSize: 13,
                              color: Medicare.primaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: const Text(
                            "Recorded",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffd1d2d2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => ViewTests(
                              patientID: widget.patientID,
                              patientName: widget.patientName,
                              customID: widget.customeID,
                            ));
                    Navigator.push(context, route);
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: const Color(0xffede8e8),
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Medicare.primaryColor,
                                BlendMode.srcATop,
                              ),
                              child: Image.asset(
                                "images/icons/18.png",
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Test Results",
                              style: TextStyle(
                                fontSize: 13,
                                color: Medicare.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                          title: Text(
                            "Thyroid Function Tests",
                            style: TextStyle(
                              fontSize: 13,
                              color: Medicare.primaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: const Text(
                            "Recorded",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffd1d2d2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => ViewPhysicalExamination(
                              patientID: widget.patientID,
                              patientName: widget.patientName,
                              customID: widget.customeID,
                            ));
                    Navigator.push(context, route);
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: const Color(0xffffd1d1),
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Medicare.primaryColor,
                                BlendMode.srcATop,
                              ),
                              child: Image.asset(
                                "images/icons/6.png",
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Physical Examination",
                              style: TextStyle(
                                fontSize: 13,
                                color: Medicare.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                          title: Text(
                            "Blood Pressure",
                            style: TextStyle(
                              fontSize: 13,
                              color: Medicare.primaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: const Text(
                            "Recorded",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffd1d2d2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => ViewImmunizations(
                              patientID: widget.patientID,
                              patientName: widget.patientName,
                              customID: widget.customeID,
                            ));
                    Navigator.push(context, route);
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: const Color(0xffcedced),
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Medicare.primaryColor,
                                BlendMode.srcATop,
                              ),
                              child: Image.asset(
                                "images/icons/2.png",
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Immunizations",
                              style: TextStyle(
                                fontSize: 13,
                                color: Medicare.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                          title: Text(
                            "Influenza Vaccine",
                            style: TextStyle(
                              fontSize: 13,
                              color: Medicare.primaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: const Text(
                            "Taken",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffd1d2d2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (_) => ViewProcedures(
                              patientID: widget.patientID,
                              patientName: widget.patientName,
                              customID: widget.customeID,
                            ));
                    Navigator.push(context, route);
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: const Color(0xFFFFE98C),
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Medicare.primaryColor,
                                BlendMode.srcATop,
                              ),
                              child: Image.asset(
                                "images/icons/7.png",
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Procedures",
                              style: TextStyle(
                                fontSize: 13,
                                color: Medicare.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                          title: Text(
                            "Cardiac Catheterization",
                            style: TextStyle(
                              fontSize: 13,
                              color: Medicare.primaryColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: const Text(
                            "Recorded",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffd1d2d2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
