import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/screens/profile/profile_page.dart';
import 'package:parkinsons_detection_app/services/auth.dart';
import 'package:parkinsons_detection_app/screens/info/personal_info_page.dart';
import 'package:parkinsons_detection_app/screens/info/medical_history_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  User user;

  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  AuthService _auth = AuthService();

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = widget.user;

    try{
      user = Provider.of<User>(context);
    }catch(e) {
      print(e);
    }

    List<Widget> _widgetOptions = <Widget>[Center(child: Text("Home")), ProfilePage(user: user,)];

    void _onTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }
}
