import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:parkinsons_detection_app/models/covid_case.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';
import 'package:collection/collection.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  List<CovidCase> cases = List(30000);
  List states = [];
  Map caseData;
  List<DataListEntry> casesData = List();

  @override
  void initState() {
    getCovidCases();
    super.initState();
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
          return createChart();
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  charts.Series<dynamic, String> createSeries(String id, int i) {
    var a = charts.Series<dynamic, String>(
        id: id,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (entry, _) => entry.dateTime,
        measureFn: (entry, _) => entry.cases,
        data: casesData);
    print(a);
    return a;
  }

  Widget createChart() {
    List<charts.Series<dynamic, String>> seriesList = [];

    print(seriesList);

    for (int i = 0; i < casesData.length; i++) {
      String id = 'WZG${i + 1}';
      seriesList.add(createSeries(id, i));
    }

    return new charts.BarChart(seriesList);
  }
}

class DataListEntry {
  var dateTime;
  int cases;

  DataListEntry({this.dateTime, this.cases});
}
