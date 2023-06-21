import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../keys.dart';

class WeatherDataPage extends StatelessWidget {
  const WeatherDataPage(this.district, {Key? key}) : super(key: key);

  final String district;

  Future<void> _fetchWeatherData() async {
    final url =
        "https://api.weatherbit.io/v2.0/current/airquality?key=$apiKey&city=$district";
    try {
      final res = await Dio().get(url);
      return res.data;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw 'No internet connection';
      }
      throw 'Something went wrong';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Data')),
      body: FutureBuilder(
        future: _fetchWeatherData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          final data = snapshot.data;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data['city_name']),
                Text('AQI: ${data['data'][0]['aqi']}'),
                Text('CO: ${data['data'][0]['co']}'),
                Text('NO2: ${data['data'][0]['no2']}'),
                Text('O3: ${data['data'][0]['o3']}'),
                Text('SO2: ${data['data'][0]['so2']}'),
                Text('PM2.5: ${data['data'][0]['pm25']}'),
                Text('PM10: ${data['data'][0]['pm10']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
