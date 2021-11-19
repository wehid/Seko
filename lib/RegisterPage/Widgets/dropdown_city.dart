import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/cities_provider.dart';
import '../../Models/ObjectModels/city.dart';

class DropdownCity extends StatefulWidget {
  final String cityId;

  DropdownCity({this.cityId});

  @override
  _DropdownCityState createState() => _DropdownCityState();
}

class _DropdownCityState extends State<DropdownCity> {
  City currentCity;
  CitiesProvider cityProvider;
  List<City> citiesList;

  @override
  void initState() {
    if (widget.cityId != null) {
      currentCity = Provider.of<CitiesProvider>(context, listen: false)
          .getCityWithCityId(widget.cityId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cityProvider = Provider.of<CitiesProvider>(context);
    citiesList = cityProvider.cityList;

    return Container(
      width: double.infinity,
      height: 55,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: DropdownButton<City>(
        hint: Text('شارەکەت هەڵبژێرە'),
        value: currentCity,
        onChanged: (newCity) {
          setState(() {
            currentCity = newCity;
            cityProvider.setSelectedCity(newCity);
          });
        },
        icon: Icon(Icons.arrow_downward_outlined),
        items: citiesList.map((city) {
          return DropdownMenuItem<City>(
            value: city,
            child: Text(city.name),
          );
        }).toList(),
      ),
    );
  }
}
