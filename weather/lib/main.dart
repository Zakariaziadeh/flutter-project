import 'package:flutter/material.dart';
import 'package:weather/Views/additional_information.dart';
import 'package:weather/Views/current_weather.dart';
import 'package:weather/api/weather.dart';
import 'package:weather/api/weatherApi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApi client = WeatherApi();
  Weather? data;
  TextEditingController cityController = TextEditingController();

  Future<void> getData() async {
    data = await client.getCurrentWeather(cityController.text);
  }

  String convertToFahrenheit(double celsius) {
    return ((celsius * 9 / 5) + 32).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  double tempInCelsius = data?.temp ?? 0.0;
                  String tempInFahrenheit = convertToFahrenheit(tempInCelsius);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      currentWeather(
                          Icons.wb_sunny_rounded,
                          "$tempInCelsius°C/$tempInFahrenheit°F",
                          "${data?.cityName}"),
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "Additional Information",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xdd212121),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: cityController,
                          decoration: InputDecoration(
                            labelText: 'Enter City Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            getData();
                          });
                        },
                        child: Text('Get Weather'),
                      ),
                      additionalInformation(
                          "${data?.wind}",
                          "${data?.humidity}",
                          "${data?.pressure}",
                          "${data?.feels_like}"),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
