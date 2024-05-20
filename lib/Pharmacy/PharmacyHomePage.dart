import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Doctor/Home/DoctorRareUnsualDiseases/allDoctorRateUnsualDiseases.dart';
import 'package:medicare/Doctor/Home/MedicalRecoreds/PatientMedicalRecoredsCatagories.dart';
import 'package:medicare/Doctor/Home/PrescribeMedicatinos/AllPrescribedMedications.dart';
import 'package:medicare/Common/ChoicePage.dart';
import 'package:medicare/Common/config/config.dart';
import 'package:medicare/Pharmacy/Home/AlternativeMediciations/AllAlternativePrescribedMedications.dart';
import 'package:medicare/Pharmacy/Home/PharmacyMedicalRecoreds/PharmacyMedicalRecoredsCatagories.dart';

class PharmacyHomePage extends StatefulWidget {
  @override
  State<PharmacyHomePage> createState() => _PharmacyHomePageState();
}

class _PharmacyHomePageState extends State<PharmacyHomePage> {
  String id = Medicare.sharedPreferences?.getString("id") ?? "";
  String name = Medicare.sharedPreferences?.getString("name") ?? "";
  String email = Medicare.sharedPreferences?.getString("phoneNumber") ?? "";
  final TextEditingController _name = TextEditingController();
  String patientID = "";
  String customeID = "";

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("No User Selected"),
          content:
              const Text("Please enter a valid Employee ID before proceeding."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearPatientInfo() {
    setState(() {
      _name.clear();
      patientID = "";
      customeID = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF3765A4), // Background color matching the image
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Welcome \nPharm.${name}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          "images/logo.png",
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          textAlign: TextAlign.right,
                          'Employee ID: ${id}',
                          style: TextStyle(color: Medicare.whiteColor),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.white,
                              height: 0.8,
                            ),
                            onChanged: (value) async {
                              var data = await FirebaseFirestore.instance
                                  .collection("users")
                                  .where("id", isEqualTo: int.parse(value))
                                  .get();

                              if (data.docs.isNotEmpty) {
                                setState(() {
                                  _name.text = data.docs[0]['name'].toString();
                                  patientID = data.docs[0].id;
                                  customeID = data.docs[0]['id'].toString();
                                });
                              } else {
                                setState(() {
                                  _name.clear();
                                  patientID = "";
                                  customeID = "";
                                });
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
                              hintText: 'Patient ID',
                              hintStyle: const TextStyle(
                                color: Colors.white70,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Medicare.whiteColor, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Medicare.whiteColor, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Medicare.whiteColor, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            controller: _name,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.white,
                              height: 0.8,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              hintText: 'Results',
                              hintStyle: const TextStyle(
                                color: Colors.white70,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Medicare.whiteColor, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Medicare.whiteColor, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Medicare.whiteColor, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        MenuItem(
                          title: 'Medical Record',
                          image: Image.asset(
                            "images/icons/16.png",
                            width: 150,
                          ),
                          voidCallback: () {
                            if (patientID.isNotEmpty) {
                              Route route = MaterialPageRoute(
                                  builder: (_) =>
                                      PharmacyMedicalRecoredsCatagories(
                                        patientID: patientID,
                                        patientName: _name.text,
                                        customeID: customeID,
                                      ));
                              Navigator.push(context, route);
                            } else {
                              _clearPatientInfo();
                              _showAlertDialog(context);
                            }
                          },
                        ),
                        MenuItem(
                          title: 'Prescriptions',
                          image: Image.asset(
                            "images/icons/10.png",
                            width: 150,
                          ),
                          voidCallback: () {
                            if (patientID.isNotEmpty) {
                              Route route = MaterialPageRoute(
                                  builder: (_) =>
                                      AllAlternativePrescribedMedications(
                                        patientID: patientID,
                                        patientName: _name.text,
                                        customeID: customeID,
                                      ));
                              Navigator.push(context, route);
                            } else {
                              _clearPatientInfo();
                              _showAlertDialog(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) {
                          Route route = MaterialPageRoute(
                              builder: (_) => const ChoicePage());
                          Navigator.push(context, route);
                        });
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String? title;
  final Widget? image;
  final String? subtitle;
  final VoidCallback? voidCallback;

  MenuItem({Key? key, this.title, this.image, this.subtitle, this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: const TextStyle(
                      color: Color(0xFF3765A4),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        color: Color(0xFF3765A4),
                      ),
                    ),
                  ],
                ],
              ),
              if (image != null)
                Positioned(
                  bottom: -40,
                  left: 15,
                  child: image!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
