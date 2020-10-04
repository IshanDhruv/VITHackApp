import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/services/auth.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;

  RegisterPage({this.toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();

  String _email = '';
  String _password = '';
  String _phoneNumber = '';
  String error = '';
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text("Register"),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    child: Tooltip(child: Icon(Icons.person), message: "Sign in"),
                    onTap: () async {
                      widget.toggleView();
                    },
                  ),
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() {
                            _email = val;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                        validator: (val) => val.length < 6 ? 'Password should be longer than 6 characters' : null,
                        onChanged: (val) {
                          _password = val;
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
                      RaisedButton(
                          child: Text("Register"),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              var result = await _auth.registerWithEmailAndPassword(_email, _password, _phoneNumber);
                              if (result == null)
                                setState(() {
                                  error = 'Need valid email and password';
                                  isLoading = false;
                                });
                            }
                          }),
                      SizedBox(height: 20),
                      Text(error),
                    ],
                  ),
                )),
          );
  }
}
