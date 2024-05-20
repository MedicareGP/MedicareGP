// Importing material design components from Flutter to build the user interface.
import 'package:flutter/material.dart';
import 'package:medicare/Common/Widgets/appBar.dart';
import 'package:medicare/Common/config/config.dart';

// The detailed page to show information about the selected disease.
class DiseaseDetailPage extends StatelessWidget {
  final Map<String, dynamic> data;

  DiseaseDetailPage({required this.data});

  Widget _buildBulletPoints(Map<String, String> sections) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sections.entries
            .where((entry) => entry.value.isNotEmpty)
            .expand((entry) {
          final title = entry.key;
          final content = entry.value;
          return [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("• ", style: TextStyle(fontSize: 16)),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "$title: ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: content),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ];
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> sections = {
      'Chief Complaint': data['chiefComplaint'],
      'Symptoms': data['symptoms'] ?? '',
      'Clinical Trial': data['clinicalTrial'] ?? '',
      'Plan Of Management': data['planOfManagement'] ?? '',
      'My Opinion': data['myOpinion'] ?? '',
      'Contact Info': data['contactInfo'] ?? '',
      'Treatment': data['treatment'] ?? '',
    };

    return Scaffold(
      appBar: appBar(
        context,
        "Rare & Unusual Diseases",
        () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Medicare.primaryColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBulletPoints(sections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
