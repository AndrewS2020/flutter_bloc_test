part of 'countries_bloc.dart';

abstract class CountriesState extends Equatable{
  @override
  List<Object> get props => [];
}

class CountriesError extends CountriesState{

}

class CountriesLoading extends CountriesState{

}

class CountryInfo extends CountriesState{
  final Country _country;
  CountryInfo(this._country);
  Country get getInfo => _country;

  @override
  List<Object> get props => [_country];
}

class CountriesLoaded extends CountriesState{
  final Countries _countries;
  CountriesLoaded(this._countries);

  @override
  List<Object> get props => [_countries,];
}

class CountriesSetSelected extends CountriesState{
  final int _index;
  CountriesSetSelected(this._index);
  int get getSelectedIndex => _index;

  @override
  List<Object> get props => [_index];

}
