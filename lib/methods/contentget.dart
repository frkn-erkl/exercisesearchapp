import 'dart:convert';
import 'package:caseapp/s_management/ExerciseListProvider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> fetchContent(
    String? exercisetype, String? muscletype, context) async {
  final response = await http.get(
    Uri.parse(
        'https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises?muscle=$muscletype&type=$exercisetype'),
    headers: {
      //key and host must be added before app start
      'X-RapidAPI-Key': '',
      'X-RapidAPI-Host': '',
    },
  );

  if (response.statusCode == 200) {
    print("response status code" + response.statusCode.toString());
    print("method çalıştı");
    final List<dynamic> responseData = json.decode(response.body);
    var providerelement =
        Provider.of<ExerciseListProvider>(context, listen: false);
    providerelement.setItems(responseData
        .map((data) => {
              "name": data["name"],
              "type": data["type"],
              "muscle": data["muscle"],
              "equipment": data["equipment"],
              "difficulty": data["difficulty"],
              "instructions": data["instructions"],
            })
        .toList());
    print("method 2. kısmı çalıştı");
    providerelement.setfilteredItems(responseData
        .map((data) => {
              "name": data["name"],
              "type": data["type"],
              "muscle": data["muscle"],
              "equipment": data["equipment"],
              "difficulty": data["difficulty"],
              "instructions": data["instructions"],
            })
        .toList());

    print("3. method çalıştı");
  } else {
    print("response status code" + response.statusCode.toString());
    throw Exception('content couldnt catch');
  }
}
