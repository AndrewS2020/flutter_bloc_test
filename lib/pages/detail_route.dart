import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_test/model/country.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DetailRoute extends StatefulWidget {
  DetailRoute({Key key, this.title, this.country}) : super(key: key);

  final String title;
  final Country country;

  @override
  _DetailRouteState createState() => _DetailRouteState();
}

class _DetailRouteState extends State<DetailRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title : Text('Country info'),
      ),
      body: DetailPage(country: widget.country,),
    );
  }
}


class DetailPage extends StatelessWidget{

  final Country country;

  const DetailPage({Key key, this.country}) : super(key: key);



  Widget buildRow(BuildContext context, String title, value, ){
    final textTheme = Theme.of(context).textTheme;

    return
      Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.white10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.headline6,),
              Text(value, style: textTheme.headline6,)
            ],
          ),
        ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
        padding: EdgeInsets.all(24),
        child: Container(
          height: 200,
          child: SvgPicture.network(country.flag,
          fit: BoxFit.fitHeight,
        ))),

        buildRow(context,'Name', country.name),
        buildRow(context,'Demonym',country.demonym,),
        buildRow(context,'Native Name', country.nativeName,),
        buildRow(context,'Domains', country.topLevelDomain.toList().toString()),
        buildRow(context,'Population', country.population.toString()),
        buildRow(context,'Code', country.numericCode),
        buildRow(context,'Time Zones', country.timezones.toList().toString())
        ]
    ),);
  }
}
