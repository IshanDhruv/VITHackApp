import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  String _name = '';
  String _phoneNumber = '';
  String _gender = 'Male';
  List _genders = ['Male', 'Female', 'Other'];

  DateTime _selectedDate = DateTime.parse("2001-01-01");
  TextEditingController _dateController;

  @override
  Widget build(BuildContext context) {
    _dateController = TextEditingController();
    _dateController.text = DateFormat().add_yMMMMd().format(_selectedDate);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: "Name"),
            validator: (val) => val.isEmpty ? 'Enter your full name' : null,
            onChanged: (val) {
              setState(() {
                _name = val;
              });
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Phone Number", border: OutlineInputBorder()),
            validator: (val) => val.length != 10 ? 'Phone Number should be 10 characters' : null,
            onChanged: (val) {
              _phoneNumber = val;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _dateController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Date of Birth",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  _selectDate(context);
                },
              ),
            ),
            validator: (val) => _selectedDate != null ? 'Please enter a date of birth' : null,
          ),
          SizedBox(height: 20),
          DropdownButton(
            hint: Text('Gender'),
            value: _gender,
            onChanged: (val) {
              setState(() {
                _gender =  val;
              });
            },
            items: _genders.map((gender) {
              return DropdownMenuItem(
                child: new Text(gender),
                value: gender,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
}
