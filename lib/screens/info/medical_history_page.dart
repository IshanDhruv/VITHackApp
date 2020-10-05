import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MedicalHistoryPage extends StatefulWidget {
  @override
  _MedicalHistoryPageState createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  String _question1 = "Any Prior Parkinsons Diagnosis or Treatment?";
  String _question2 = "Diagnosis/Treatment details (if any)";
  String _question3 = "Medical Conditions";
  bool _question1Option = false;
  bool _othersOption = false;
  bool _finalCheck = false;
  File _image;
  ScrollController _scrollController = ScrollController();

  Map<String, bool> values = {
    'Blood Pressure': false,
    'Heart Problem': false,
    'Asthma': false,
    'Diabetes': false,
    'Bleeding Disorder': false,
    'Drug Allergy': false,
    'Respiratory Disorder': false,
    'Stomach Problem': false,
    'Thyroid': false,
    'Kidney Problem': false,
    'Liver Problem': false,
    'Skin Problem': false,
    'Pregnancy': false,
    'Others': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_question1),
          SizedBox(height: 20),
          Visibility(
              visible: _question1Option,
              child: TextField(
                decoration: InputDecoration(hintText: "A small description"),
              )),
          Text(_question2),
          Center(
            child: RaisedButton(
                child: Text("Upload"),
                onPressed: () async {
                  _imgFromGallery();
                }),
          ),
          SizedBox(height: 20),
          Text(_question3),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: _scrollController,
                children: values.keys.map((String key) {
                  return CheckboxListTile(
                    activeColor: Theme.of(context).primaryColor,
                    title: Text(key),
                    value: values[key],
                    onChanged: (bool value) {
                      setState(() {
                        values[key] = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          Visibility(
              visible: _othersOption,
              child: TextField(
                decoration: InputDecoration(hintText: "Please specify"),
              )),
          SizedBox(height: 20),
          CheckboxListTile(
            title: Text("I have reviewed the information on this page and it is accurate to the best of my knowledge"),
              value: _finalCheck,
              onChanged: (bool value) {
                setState(() {
                  _finalCheck = value;
                });
              }),
          Center(child: RaisedButton(child: Text("Proceed"), onPressed: showBottomPanel,))
        ],
      ),
    );
  }

  _imgFromGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if(image != null)
        _image = File(image.path);
    });
  }

  void showBottomPanel() {
    //Creates bottom sheet for user to enter his data
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "I understand that this information will be used by the app "
                        "to help determine appropriate diagnosis and treatment. "
                        "If there is any change in my medical status, "
                        "I will make the neccary changes."),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(child: Text("Go Back"),onPressed: () {}),
                    RaisedButton(child: Text("Yes, Confirm"),onPressed: () {}),
                  ],
                )
              ],
            ),
          );
        });
  }
}
