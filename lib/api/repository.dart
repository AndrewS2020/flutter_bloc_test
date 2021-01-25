

import 'package:flutter_bloc_test/api/api.dart';
import 'package:flutter_bloc_test/model/country.dart';

class CountriesRepository{

  Api api = Api();

  Future<List<Country>> fetchCountries(String filter) => api.fetchCountries(filter);



}