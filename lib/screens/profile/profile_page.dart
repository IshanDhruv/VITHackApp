import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _devicewidth = MediaQuery.of(context).size.width;
    final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
    final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

    List _conditions = ["Asthma", "Others"];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _deviceHeight * 0.1),
            Center(child: Text(user.displayName)),
            Center(child: Text(user.email)),
            SizedBox(height: 40),
            ExpansionTileCard(
              key: cardA,
              title: Text("My Personal Info"),
              leading: Icon(Icons.add),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date of Birth",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(DateTime.parse("2020-01-22").toString()),
                        SizedBox(height: 15),
                        Text("Gender",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("M")
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 40),
            ExpansionTileCard(
              key: cardB,
              title: Text("My Medical History"),
              leading: Icon(Icons.add),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Previous Parkinson's Diagnosis?",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("No"),
                        SizedBox(height: 15),
                        Text("Other Medical Problems",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("Other problems here"),
                        SizedBox(height: 15),
                        Text("Medical Conditions",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Text(_conditions[index]);
                          },
                          itemCount: _conditions.length,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
