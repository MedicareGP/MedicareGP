import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicare/Common/ChoicePage.dart';
import 'package:medicare/Common/Widgets/DialogBox/errorDialog.dart';
import 'package:medicare/Common/Widgets/DialogBox/loadingDialog.dart';
import 'package:medicare/Common/Widgets/appBar.dart';
import 'package:medicare/Common/config/config.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Medicare.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          width: 45,
                          height: 45,
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                          color: Medicare.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Image.asset("images/logo.png"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 14),
                        width: 2,
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Medicare.whiteColor,
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Access Your \nAccount",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 30, bottom: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _fullName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 0.8,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  hintText: 'Enter Full Name',
                                  hintStyle: TextStyle(
                                    color: Medicare.whiteColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Medicare.whiteColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 1.0),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _email,
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 0.8,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  hintText: 'Enter Email',
                                  hintStyle: TextStyle(
                                    color: Medicare.whiteColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Medicare.whiteColor),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: _password,
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 0.8,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  hintText: 'Enter Password',
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  hintStyle: TextStyle(
                                    color: Medicare.whiteColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Medicare.whiteColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (!RegExp(
                                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}$')
                                      .hasMatch(value)) {
                                    return 'Password must contain at least 8 characters, including uppercase, lowercase, and a special character';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: _date,
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 0.8,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  hintText: 'Date Of Birthday',
                                  hintStyle:
                                      TextStyle(color: Medicare.whiteColor),
                                  prefixIcon: const Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Medicare.whiteColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 2.0),
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  _selectDate(context);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select your birthday';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _phoneNumber,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 0.8,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  hintText: 'Enter Phone Number',
                                  hintStyle:
                                      TextStyle(color: Medicare.whiteColor),
                                  prefixIcon: Image.asset(
                                    "images/icons/5.png",
                                    width: 50,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Medicare.whiteColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  if (value.length != 10) {
                                    return 'Phone number must be 10 digits';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _idController,
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  color: Colors.white,
                                  height: 0.8,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  hintText: 'National ID',
                                  hintStyle:
                                      TextStyle(color: Medicare.whiteColor),
                                  prefixIcon: const Icon(
                                    Icons.vpn_key,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Medicare.whiteColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Medicare.whiteColor, width: 2.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your National ID';
                                  }
                                  if (value.length != 10) {
                                    return 'National ID must be 10 digits';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                  const Size(140, 50),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Medicare.whiteColor),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ValidatingData();
                                }
                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  color: Medicare.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Route route = MaterialPageRoute(
                                    builder: (_) => ChoicePage());
                                Navigator.push(context, route);
                              },
                              child: Text(
                                "Already Registered? Login",
                                style: TextStyle(
                                  color: Medicare.whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1800),
      firstDate: DateTime(1800),
      lastDate: DateTime(2011),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _date.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  ValidatingData() async {
    _date.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _fullName.text.isNotEmpty &&
            _phoneNumber.text.isNotEmpty &&
            _idController.text.length == 10
        ? checkingData()
        : displayDialog();
  }

  checkingData() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingAlertDialog(
            message: "Authenticating user...",
          );
        });
    register();
  }

  void register() async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _email.text.trim(), password: _password.text.trim())
        .then((auth) async {
      String UID = auth.user!.uid;
      await auth.user!.sendEmailVerification();
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) {
          return const ErrorAlertDialog(
            message: "We sent your verification link to your email.",
          );
        },
      );
      addingUserData(UID);
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (c) => ErrorAlertDialog(
          message: error.toString(),
        ),
      );
    });
  }

  addingUserData(String UID) async {
    await FirebaseFirestore.instance.collection("users").doc(UID).set({
      'name': _fullName.text.trim(),
      'email': _email.text.trim(),
      "id": _idController.text.trim(),
      'phoneNumber': _phoneNumber.text.trim(),
      "dateRegistered": DateTime.now(),
      "type": "patient",
      "Birthday": _date.text.trim(),
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account Was Created, Please Verify your account."),
        ),
      );
    });
  }

  displayDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) {
        return const ErrorAlertDialog(
          message: "Fill up the form",
        );
      },
    );
  }
}
