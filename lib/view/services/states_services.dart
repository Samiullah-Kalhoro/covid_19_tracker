import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/world_states_model.dart';

import 'utils/app_url.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStates() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

    Future<List<dynamic>> countriesListApi() async {
    final response = await http.get(Uri.parse(AppUrl.countryList));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
