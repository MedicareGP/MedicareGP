import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare/Common/config/config.dart';

class RequestAccess extends StatefulWidget {
  @override
  State<RequestAccess> createState() => _RequestAccessState();
}

class _RequestAccessState extends State<RequestAccess> {
  final TextEditingController _phoneController = TextEditingController();
  Stream<QuerySnapshot>? _userStream;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void updateUserStream(String phone) {
    if (phone.isEmpty) {
      return; // Optionally handle empty phone input.
    }
    _userStream = FirebaseFirestore.instance
        .collection('users')
        .where('phoneNumber',
            isEqualTo: phone) // Assuming 'phone' is the field name in Firestore
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Medicare.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Welcome \nDoctor. Mohammed!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Image.asset("images/logo.png"),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            "Enter Patient Phone Number",
                            style: TextStyle(
                              color: Medicare.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsets.all(5),
                        child: TextField(
                          controller: _phoneController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Enter phone number",
                            contentPadding:
                                const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xffc8d2d3),
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Medicare.whiteColor,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Medicare.whiteColor,
                              size: 24,
                            ),
                            prefixIconConstraints: const BoxConstraints(
                                minWidth: 50, minHeight: 23),
                          ),
                          onSubmitted: updateUserStream,
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: _userStream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Text("No user found",
                                style: TextStyle(color: Colors.white));
                          }
                          var userData = snapshot.data!.docs.first.data()
                              as Map<String, dynamic>;
                          return Column(
                            children: [
                              Text("User: ${userData['name']}",
                                  style: const TextStyle(color: Colors.white)),
                              ElevatedButton(
                                onPressed: () {
                                  // Implement the request access logic here
                                },
                                child: const Text('Request Access'),
                              )
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: Divider(
                          color: Medicare.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
