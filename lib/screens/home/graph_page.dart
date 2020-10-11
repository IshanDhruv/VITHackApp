import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:parkinsons_detection_app/models/covid_case.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';
import 'package:collection/collection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  GlobalKey _globalKey = GlobalKey();
  List<CovidCase> cases = List(30000);
  List states = [];
  Map caseData;
  List<DataListEntry> casesData = List();

  @override
  void initState() {
    getCovidCases();
    super.initState();
  }

  Future<void> _save() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();

    //Request permissions if not already granted
    if (!(await Permission.storage.status.isGranted))
      await Permission.storage.request();

    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: 60,
        name: "canvas_image");
    Fluttertoast.showToast(
      msg: "Image is stored at " + result,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
    );
    print(result);
  }

  getCovidCases() async {
    var response = await APICalls().getCovidCases();
    List data = json.decode(response);
    for (int i = 0; i < data.length; i++) {
      cases[i] = CovidCase.fromJson(data[i]);
    }
    cases.sort((a, b) {
      try {
        return a.reportedOn.compareTo(b.reportedOn);
      } catch (e) {
        return 0;
        print(e);
      }
    });

    caseData = groupBy(cases, (obj) {
      try {
        if (obj.reportedOn != null) return obj.reportedOn;
      } catch (e) {
        return 0;
      }
    });

    caseData.forEach((key, value) {
      return casesData.add(DataListEntry(
          dateTime: DateFormat('yyyy-MM-dd').format(key).toString(),
          cases: value.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCovidCases(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.download_rounded),
                onPressed: () async {
                  _save();
                },
              ),
              body: RepaintBoundary(key: _globalKey, child: createChart()));
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget createChart() {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(text: 'Covid Cases'),
      series: <ChartSeries<DataListEntry, String>>[
        BarSeries(
            dataSource: casesData,
            xValueMapper: (DataListEntry entry, _) => entry.dateTime,
            yValueMapper: (DataListEntry entry, _) => entry.cases),
      ],
    );
  }
}

class DataListEntry {
  var dateTime;
  int cases;

  DataListEntry({this.dateTime, this.cases});
}
