import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/services/auth.dart';
import 'package:parkinsons_detection_app/screens/info/personal_info_page.dart';
import 'package:parkinsons_detection_app/screens/info/medical_history_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: Tooltip(child: Icon(Icons.exit_to_app), message: "Logout"),
                onTap: () => _auth.signOut(),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Personal Info",),
              Tab(text: "Medical History"),
            ],
          ),),
        body: Center(
          child: TabBarView(
            children: [
              PersonalInfoPage(),
              MedicalHistoryPage()
            ],
          ),
        ),
      ),
    );
  }
}
