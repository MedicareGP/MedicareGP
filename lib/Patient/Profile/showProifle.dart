import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare/Common/ChoicePage.dart';
import 'package:medicare/Common/Widgets/appBar.dart';
import 'package:medicare/Common/config/config.dart';

class UserProfileScreen extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Profile", () {
        Navigator.pop(context);
      }), // Adding a custom app bar with the title "Profile".
      backgroundColor: Medicare
          .primaryColor, // Setting the background color of the entire screen to Medicare's primary color.
      body: Container(
        color: const Color(0xFF5079A4),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData || snapshot.hasError) {
                  return Text('Error loading profile data.');
                }

                var userData = snapshot.data!.data() as Map<String, dynamic>;

                String name = userData['name'] ?? 'N/A';
                String healthId = userData['id'].toString();
                String dob = userData['Birthday'] ?? 'N/A';
                String nationalId = userData['id'].toString();
                String phoneNumber = userData['phoneNumber'] ?? 'N/A';
                String email = userData['email'] ?? 'N/A';
                String address = userData['address'] ?? 'N/A';

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child:
                                Text(name[0], style: TextStyle(fontSize: 24)),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('Health ID: $healthId'),
                          const SizedBox(height: 10),
                          const Divider(
                            height: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _buildProfileItem(
                                  'Date of Birth',
                                  dob,
                                  Icons.calendar_today,
                                ),
                              ),
                              Container(
                                width: 0.5,
                                color: Colors.grey,
                                height: 80,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _buildProfileItem(
                                  'National ID',
                                  nationalId,
                                  Icons.credit_card,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          _buildProfileItem(
                            'Phone Number',
                            phoneNumber,
                            Icons.phone,
                            isEditable: true,
                          ),
                          _buildProfileItem(
                            'Email Address',
                            email,
                            Icons.email,
                            isEditable: true,
                          ),
                          _buildProfileItem(
                            'Address',
                            address,
                            Icons.location_on,
                            isEditable: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut().then((value) {
                          Route route = MaterialPageRoute(
                              builder: (_) => const ChoicePage());
                          Navigator.push(context, route);
                        });
                      },
                      icon: const Icon(Icons.logout, color: Colors.white),
                      label: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value, IconData icon,
      {bool isEditable = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  Text(value, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
          if (isEditable)
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                // Handle edit
              },
            ),
        ],
      ),
    );
  }
}
