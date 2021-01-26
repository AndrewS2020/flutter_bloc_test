import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/api/repository.dart';
import 'package:flutter_bloc_test/model/countries.dart';
import 'package:flutter_bloc_test/model/country.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {

  Countries countriesItems = Countries();
  CountriesBloc(CountriesState initialState) : super(initialState);

  @override
  Stream<CountriesState> mapEventToState(CountriesEvent event) async* {

    if(event is FetchCountries) {
      yield CountriesLoading();
      try {
        countriesItems.data = await CountriesRepository().fetchCountries(event._filter);
        countriesItems.selectedIndex = -1;
        yield CountriesLoaded(countriesItems);
      } catch (e) {
        yield CountriesError();
      }
    }

    if(event is Filtering){
      yield CountriesLoading();

      if ((event._filter??'').isNotEmpty){
        countriesItems.filter = event._filter;
        yield CountriesFiltering(countriesItems);
      }
    }

    if(event is SetSelectedIndex){
      yield CountriesSetSelected(countriesItems.selectedIndex);
    }
  }

}
