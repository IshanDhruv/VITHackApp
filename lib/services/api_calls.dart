import 'dart:convert';

import 'package:parkinsons_detection_app/models/beds.dart';
import 'package:parkinsons_detection_app/models/contact.dart';
import 'package:parkinsons_detection_app/models/medical_colleges.dart';
import 'package:parkinsons_detection_app/models/notification.dart';
import 'package:parkinsons_detection_app/services/api_response.dart';
import 'package:parkinsons_detection_app/services/api_routes.dart';
import 'package:http/http.dart' as http;

class APICalls {
  final uri = BaseUrl;

  getContactInformation() async {
    print("getting contact info");
    final url = uri + contactsRoute;
    try {
      final response =
          await http.get(url, headers: {"Accept": "application/json"});
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          return ApiResponse.completed(
                  Contact.fromJson(json.decode(response.body)))
              .data;
      }
    } catch (e) {
      print(e);
    }
  }

  getNotifications() async {
    print("getting notifications");
    final url = uri + notificationsRoute;
    try {
      final response =
          await http.get(url, headers: {"Accept": "application/json"});
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          return ApiResponse.completed(
                  NotificationClass.fromJson(json.decode(response.body)))
              .data;
      }
    } catch (e) {
      print(e);
    }
  }

  getBeds() async {
    print("getting beds");
    final url = uri + hospitalsGroup + bedsRoute;
    try {
      final response =
          await http.get(url, headers: {"Accept": "application/json"});
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          print(json.decode(response.body)['data']['sources']);
          return ApiResponse.completed(
                  Beds.fromJson(json.decode(response.body)))
              .data;
      }
    } catch (e) {
      print(e);
    }
  }

  getMedicalColleges() async {
    print("getting colleges");
    final url = uri + hospitalsGroup + collegesRoute;
    try {
      final response =
          await http.get(url, headers: {"Accept": "application/json"});
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          return ApiResponse.completed(
                  MedicalColleges.fromJson(json.decode(response.body)))
              .data;
      }
    } catch (e) {
      print(e);
    }
  }
}
