import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/models/beds.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';

class BedsPage extends StatefulWidget {
  @override
  _BedsPageState createState() => _BedsPageState();
}

class _BedsPageState extends State<BedsPage> {
  APICalls apiCalls = APICalls();
  Beds beds;
  bool _isLoading = true;

  @override
  void initState() {
    getBeds();
    super.initState();
  }

  getBeds() async {
    setState(() {
      _isLoading = true;
    });
    beds = await apiCalls.getBeds();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: beds.regional.length,
                  itemBuilder: (context, index) {
                    return Text(beds.regional[index]["state"]);
                  },
                )
              ],
            ),
          );
  }
}
