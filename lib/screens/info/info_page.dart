import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/screens/info/personal_info_page.dart';
import 'package:parkinsons_detection_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'medical_history_page.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Info"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                child:
                    Tooltip(child: Icon(Icons.exit_to_app), message: "Logout"),
                onTap: () => _auth.signOut(),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Personal Info",
              ),
              Tab(text: "Medical History"),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [PersonalInfoPage(), MedicalHistoryPage()],
          ),
        ),
      ),
    );
  }
}