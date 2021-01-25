part of 'countries_bloc.dart';

abstract class CountriesEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class SetSelectedIndex extends CountriesEvent{
  final int _index;
  SetSelectedIndex(this._index);

  @override
  List<Object> get props => [_index];
}

class FetchCountries extends CountriesEvent{
  final String _filter;
  FetchCountries(this._filter);

  @override
  List<Object> get props => [_filter];
}
