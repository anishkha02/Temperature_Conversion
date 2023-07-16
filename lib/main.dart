import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.blueAccent.shade200,
        scaffoldBackgroundColor: Colors.blueGrey[50],
        appBarTheme: AppBarTheme(
          color: Colors.blueAccent.shade200,
          // iconTheme: Theme.of(context).textTheme.copyWith(
          //   headline6: TextStyle(color: Colors.white, fontSize: 20),
          // ),
        ),
      ),
      home: TemperatureConverterScreen(),
    );
  }
}

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() =>
      _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState
    extends State<TemperatureConverterScreen> {
  TextEditingController _celsiusController = TextEditingController();
  TextEditingController _fahrenheitController = TextEditingController();

  void _convertCelsiusToFahrenheit() {
    double celsius = double.tryParse(_celsiusController.text) ?? 0.0;
    double fahrenheit = (celsius * 9 / 5) + 32;
    _fahrenheitController.text = fahrenheit.toStringAsFixed(2);
  }

  void _convertFahrenheitToCelsius() {
    double fahrenheit = double.tryParse(_fahrenheitController.text) ?? 0.0;
    double celsius = (fahrenheit - 32) * 5 / 9;
    _celsiusController.text = celsius.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Celsius to Fahrenheit',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: _celsiusController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Celsius',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _convertCelsiusToFahrenheit,
                      child: Text('Convert'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Fahrenheit to Celsius',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: _fahrenheitController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Fahrenheit',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _convertFahrenheitToCelsius,
                      child: Text('Convert'),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
