import 'package:flutter/services.dart';
import 'package:news_app/models/new_data.dart';
import 'dart:convert';

List<NewData> newdatas = [];

Future<List<NewData>> loadJson() async {
  String jsonString = await rootBundle.loadString('assets/data.json');
  List<dynamic> jsonList = json.decode(jsonString);

  return jsonList.map((e) => NewData.tojson(e)).toList();
}
// Future<List<NewData>> loadJson() async {
//   String jsonString = await rootBundle.loadString('assets/data.json');
//   List<dynamic> jsonList = json.decode(jsonString);

//   return jsonList.forEach((e) {
//     NewData N1 = NewData.tojson(e);
//     newdatas.add(N1);
//   });
// }
