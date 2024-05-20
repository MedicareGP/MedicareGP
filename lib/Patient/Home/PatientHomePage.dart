import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/Patient/Home/MedicalRecords/LabResults/viewTests.dart';
import 'package:medicare/Patient/Home/MedicalRecords/PatientMedicalRecords.dart';
import 'package:medicare/Patient/Home/Medications/PatientMedication.dart';
import 'package:medicare/Patient/Profile/showProifle.dart';
import 'package:medicare/Common/config/config.dart';

class PatientHomePage extends StatefulWidget {
  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  int id = Medicare.sharedPreferences?.getInt("id") ?? 0;
  String name = Medicare.sharedPreferences?.getString("name") ?? "";
  String email = Medicare.sharedPreferences?.getString("phoneNumber") ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF3765A4), // Background color matching the image
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Icon(Icons.notifications_active,
                            color: Color.fromARGB(255, 250, 225, 0)),
                        SizedBox(height: 4),
                        Text(
                          'reminders',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (_) => UserProfileScreen());
                        Navigator.push(context, route);
                      },
                      child: Container(
                        child: const Column(
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome ${name}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'How are you doing today?\nWe\'re wishing you well.',
                            style:
                                TextStyle(color: Colors.white54, fontSize: 13),
                          ),
                        ],
                      ),
                      Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width * 0.3,
                      ), // Displaying an image, assumed to be the logo.
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50, // Adjusted to account for the border width
                        height: 50, // Adjusted to account for the border width
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF3765A4), // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: const AssetImage(
                              'images/profile.jpg'), // Add your image asset here
                          child: Text(
                            name.characters.first,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${name}",
                              style: TextStyle(
                                color: Medicare.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Health ID: ${id}',
                              style: TextStyle(color: Medicare.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (_) => UserProfileScreen());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          'Details >',
                          style: TextStyle(color: Medicare.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.all(
                        16.0), // Add padding for better spacing
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        MenuItem(
                          title: 'Test Result',
                          image: Image.asset(
                            "images/icons/16.png",
                            width: 150,
                          ),
                          voidCallback: () {
                            Route route = MaterialPageRoute(
                                builder: (_) => PatientViewTests());
                            Navigator.push(context, route);
                          },
                        ),
                        MenuItem(
                          title: 'Medical Record',
                          image: Image.asset(
                            "images/icons/10.png",
                            width: 150,
                          ),
                          voidCallback: () {
                            Route route = MaterialPageRoute(
                                builder: (_) => PatientMedicalRecords());
                            Navigator.push(context, route);
                          },
                        ),
                        MenuItem(
                          title: 'Prescriptions',
                          image: Image.asset(
                            "images/icons/17.png",
                            width: 150,
                          ),
                          voidCallback: () {
                            Route route = MaterialPageRoute(
                                builder: (_) => PatientMedication());
                            Navigator.push(context, route);
                          },
                        ),
                        MenuItem(
                          title: 'Upcoming Appointment',
                          image: Image.asset("images/icons/16.png"),
                          subtitle:
                              'Dr. Ali Ahmed\nAl-Noor Hospital\nToday, 8 PM',
                        ),
                      ],
                    ),
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
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 12,
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
