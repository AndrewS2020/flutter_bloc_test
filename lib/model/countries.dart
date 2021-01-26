import 'country.dart';

class Countries {
  List<Country> data;
  int selectedIndex=-1;
  String filter='';

  List<Country> get items{
    if (data == null) return null;
    return data.where((element) => element.name.toUpperCase().contains(filter.toUpperCase())).toList();
  }

}