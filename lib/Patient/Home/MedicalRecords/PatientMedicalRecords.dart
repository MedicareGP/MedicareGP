// Importing material design components from Flutter to build the user interface.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/Test/viewTests.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/allergies/ViewAllergies.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/immunizations/ViewImmunizations.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/physicalExamination/ViewPhysicalExamination.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/procedures/ViewProcedures.dart';
import 'package:medicare/Patient/Home/MedicalRecords/Allergies/ViewAllergies.dart';
import 'package:medicare/Patient/Home/MedicalRecords/Immunizations/ViewImmunizations.dart';
import 'package:medicare/Patient/Home/MedicalRecords/LabResults/viewTests.dart';
import 'package:medicare/Patient/Home/MedicalRecords/PhysicalExamination/ViewPhysicalExamination.dart';
import 'package:medicare/Patient/Home/MedicalRecords/Procedures/ViewProcedures.dart';
import 'package:medicare/Patient/Home/MedicalRecords/presciribedMedications/PatientPresciribedMedicatgions.dart';
// Importing a custom app bar widget from the Medicare project.
import 'package:medicare/Common/Widgets/appBar.dart';
// Importing a custom clipper for stylistic container shaping.
import 'package:medicare/Common/Widgets/appCustomClipper.dart';
// Importing configuration settings like color schemes from the Medicare project.
import 'package:medicare/Common/config/config.dart';

// Defining a StatefulWidget to handle state changes for the PatientMedicalRecords.
class PatientMedicalRecords extends StatefulWidget {
  PatientMedicalRecords({
    super.key,
  });

  @override
  // Creating the state for this widget.
  State<PatientMedicalRecords> createState() => _PatientMedicalRecordsState();
}

// Private State class for handling the dynamic aspects of the PatientMedicalRecords.
class _PatientMedicalRecordsState extends State<PatientMedicalRecords> {
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
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (_) => PatientPresciribedMedicatgions());
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
                          builder: (_) => PatientViewAllergies());
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
                      Route route =
                          MaterialPageRoute(builder: (_) => PatientViewTests());
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
                          builder: (_) => PatientViewPhysicalExamination());
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
                          builder: (_) => PatientViewImmunizations());
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
                          builder: (_) => PatientViewProcedures());
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
            ),
          ],
        ),
      ),
    );
  }
}
