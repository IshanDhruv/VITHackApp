import 'package:flutter/material.dart';

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
  ScrollController _scrollController = ScrollController();

  Map<String, bool> values = {
    'Blood Pressure': false,
    'Heart Problem': false,
    'Asthma': false,
    'Diabetes': false,
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
          Visibility(visible: _question1Option, child: TextField(decoration: InputDecoration(hintText: "A small description"),)),
          Text(_question2),
          Center(
            child: RaisedButton(child: Text("Register"), onPressed: () async {}),
          ),
          SizedBox(height: 20),
          Text(_question3),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
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
          Visibility(visible: _question1Option, child: TextField(decoration: InputDecoration(hintText: "Please specify"),)),
        ],
      ),
    );
  }
}
