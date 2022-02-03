import 'package:flutter/material.dart';
import 'package:provider_deneme/widgets/last_update_time.dart';
import 'package:provider_deneme/widgets/location.dart';
import 'package:provider_deneme/widgets/min_max_temperature.dart';
import 'package:provider_deneme/widgets/select_city.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  String userChoosedCity = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                userChoosedCity = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectCityWidget()));
                debugPrint("Seçilen sehir: " + userChoosedCity);
              }),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: LocationWidget(
                selectedCity: userChoosedCity,
              )),
            ),
            const SizedBox(height: 36),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: LastUpdateTime()),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: MinMaxTemperature()),
            ),
          ],
        ),
      ),
    );
  }
}
