
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/countries_bloc.dart';
import 'package:flutter_bloc_test/pages/detail_route.dart';
import 'package:flutter_svg/svg.dart';



class HomeRoute extends StatefulWidget {
  HomeRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title : Text('Search country test'),
      ),
      body: BlocProvider(
        create: (context) => CountriesBloc(CountriesLoading()),
        child: MainPage(),
      ),
    );
  }
}



class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //CountriesBloc countriesBloc = BlocProvider.of<CountriesBloc>(context);

    return BlocBuilder<CountriesBloc, CountriesState>(
      builder: (context, state) {
          return Column(
            children: [
              Container(
                child: Text('Search countries',
                  style: Theme.of(context).textTheme.headline3
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  onChanged: (text) {
                    if ((text ?? '') != '') {
                      BlocProvider.of<CountriesBloc>(context).add(FetchCountries(text));
                    }
                  },
                ),
              ),
              Container(height: 32,),
              Expanded(
                child: buildList(context)
              ),
            ],
          );
        }
    );
  }

  Widget buildList(BuildContext context) {

    final _countries = BlocProvider.of<CountriesBloc>(context).countriesItems;
    final _state = BlocProvider.of<CountriesBloc>(context).state;

    if (_state is CountriesLoading) {
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircularProgressIndicator(),
            ]
        ),
      );
    }

    if (_state is CountriesLoaded || _state is CountriesSetSelected) {

      return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text('search result:',
                  style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.amber),),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _countries.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 1, bottom: 1),
                        child: ListTile(
                          tileColor: Colors.white10,
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            width: 80, //height: 50,
                            child: SvgPicture.network(
                              _countries.items[index].flag,
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Text(_countries.items[index].name,
                              style: Theme.of(context).textTheme.subtitle1,
                          ),
                          selected: _countries.selectedIndex==index,
                          selectedTileColor: Colors.blueGrey.shade600,
                          subtitle: AnimatedContainer(
                            //make animated expand-collapse
                            duration: Duration(microseconds: 1000),
                            child:
                              _countries.selectedIndex==index
                                ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(BlocProvider.of<CountriesBloc>(context).countriesItems.items[index].demonym),
                                    Text(BlocProvider.of<CountriesBloc>(context).countriesItems.items[index].nativeName),
                                    Text(BlocProvider.of<CountriesBloc>(context).countriesItems.items[index].numericCode),
                                    RaisedButton(
                                      child: Text('More'),
                                      onPressed: (){
                                        final _country = BlocProvider.of<CountriesBloc>(context).countriesItems.items[index];
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => DetailRoute(country: _country,),
                                        ),);
                                      }
                                    ),
                                  ])
                                : Container(),
                            ),
                            onTap: (){
                              FocusScope.of(context).requestFocus();
                              _countries.selectedIndex = index;
                              BlocProvider.of<CountriesBloc>(context).add(SetSelectedIndex(index));
                            },
                          ),
                        );
                    }),
              ),
            ]
        ),
      );
    }
    return Container(
      color: Colors.red.shade500,
      child: Center(
        child: Text('Not found',
          style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }

}