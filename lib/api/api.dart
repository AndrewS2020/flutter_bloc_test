export 'package:http/http.dart';

import 'dart:convert';

import 'package:flutter_bloc_test/model/country.dart';
import 'package:http/http.dart' as http;

class Api{

  final baseUrl = 'https://restcountries.eu/rest/v2/';

  Future<List<Country>> fetchCountries(String filter) async {

    List<Country> _list = List();
    final response = await http.get(baseUrl + 'name/' + filter);

    print('--->' + json.decode(response.body).toString() );

    String ss = response.body;
    (json.decode(ss) as List).forEach((c) {
      _list.add(Country.fromJson(c));
      print('   * * *   ');

    });

    return _list;
  }

}