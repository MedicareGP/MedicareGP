// Importing material design components from Flutter to build the user interface.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare/Doctor/Home/DoctorRareUnsualDiseases/DiseasesDetailesPage.dart';
import 'package:medicare/Doctor/Home/DoctorRareUnsualDiseases/differentRareDiseases/Progonsis.dart';
import 'package:medicare/Doctor/Home/DoctorRareUnsualDiseases/differentRareDiseases/UndianosedSympotmos.dart';
import 'package:medicare/Doctor/Home/DoctorRareUnsualDiseases/differentRareDiseases/UntreatableDiagnosis.dart';
// Importing a custom app bar widget from the Medicare project.
import 'package:medicare/Common/Widgets/appBar.dart';
// Importing configuration settings like color schemes from the Medicare project.
import 'package:medicare/Common/config/config.dart';

// Defining a StatefulWidget to handle state changes for viewing prescribed medications in a pharmacy app.
class AllDoctorRateUnusualDiseases extends StatefulWidget {
  @override
  // Creating the state for this widget.
  State<AllDoctorRateUnusualDiseases> createState() =>
      _AllDoctorRateUnusualDiseasesState();
}

// Private State class for handling the dynamic aspects of the AllDoctorRateUnusualDiseases screen.
class _AllDoctorRateUnusualDiseasesState
    extends State<AllDoctorRateUnusualDiseases> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  String? currentUser = FirebaseAuth.instance.currentUser?.uid;

  void _showOptions(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      items: [
        PopupMenuItem<String>(
          value: 'Prognosis',
          child: const Text('Prognosis'),
          onTap: () {
            Route route = MaterialPageRoute(builder: (_) => Prognosis());
            Navigator.push(context, route);
          },
        ),
        PopupMenuItem<String>(
          value: 'Undiagnosed Symptoms',
          child: const Text('Undiagnosed Symptoms'),
          onTap: () {
            Route route =
                MaterialPageRoute(builder: (_) => UndianosedSympotmos());
            Navigator.push(context, route);
          },
        ),
        PopupMenuItem<String>(
          value: 'Untreatable Diagnosis',
          child: const Text('Untreatable Diagnosis'),
          onTap: () {
            Route route =
                MaterialPageRoute(builder: (_) => UntreatableDiagnosis());
            Navigator.push(context, route);
          },
        ),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected != null) {
        // Define your action for each item here
        print(itemSelected);
      }
    });
  }

  @override
  // Building the widget tree for this state.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        "Rare & Unusual Diseases",
        () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Medicare
          .primaryColor, // Setting the background color of the entire screen to Medicare's primary color.
      body: SingleChildScrollView(
        // A scrolling widget that enables vertical scrolling if the content is too large to fit on the screen.
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      height: 50,
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value.toLowerCase();
                          });
                        },
                        textAlign: TextAlign
                            .start, // Align the text inside the TextField
                        style: const TextStyle(
                          color: Colors.white,
                          height:
                              0.8, // Reduces the line height, which effectively makes the TextField shorter
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical:
                                  8), // Reduces the vertical padding, making the field shorter
                          hintText:
                              'Search...', // Hint text that appears in the center
                          hintStyle: const TextStyle(
                            color: Colors.white, // Style the hint text
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            // Creates a border around the TextField
                            borderRadius: BorderRadius.circular(
                                30), // Consistent border radius when the field is enabled
                            borderSide: BorderSide(
                              color: Medicare.whiteColor,
                              width: 1.0,
                            ), // Normal state border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                30), // Consistent border radius when the field is enabled
                            borderSide: BorderSide(
                              color: Medicare.whiteColor,
                              width: 1.0,
                            ), // Normal state border
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                30), // Consistent border radius when the field is enabled
                            borderSide: BorderSide(
                              color: Medicare.whiteColor,
                              width: 1.0,
                            ), // Normal state border
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Builder(
                          builder: (context) => IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Medicare.primaryColor,
                              size: 20,
                            ),
                            onPressed: () => _showOptions(context),
                          ),
                        ),
                      ),
                      const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('rareDiseases')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final docs = snapshot.data!.docs;
                final filteredDocs = docs.where((eachDoc) {
                  final diseaseName =
                      eachDoc['chiefComplaint'].toString().toLowerCase();
                  return diseaseName.contains(searchQuery);
                }).toList();
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredDocs.length,
                  itemBuilder: (context, index) {
                    final data = filteredDocs[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiseaseDetailPage(
                                data: data.data() as Map<String, dynamic>),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.all(
                                  6), // Margin around each medication detail container.
                              padding: const EdgeInsets.all(
                                  15), // Padding inside each medication detail container.
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15), // Rounded corners for the container.
                                color: Medicare
                                    .whiteColor, // Background color set to white.
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      data[
                                          'chiefComplaint'], // Medication name and dosage.
                                      style: TextStyle(
                                        color: Medicare
                                            .primaryColor, // Text color set to Medicare's primary color.
                                      ),
                                    ),
                                  ),
                                  // Add more details here if needed
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
