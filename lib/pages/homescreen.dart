import 'package:flutter/material.dart';
import 'package:meow_weather/pages/LocationScreen.dart';
import 'package:meow_weather/pages/settingsscreen.dart';
import 'package:meow_weather/data/data_service.dart';
import 'package:flutter_charts/flutter_charts.dart';

import 'package:meow_weather/data/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  final _fcService = FCService();
  FCResponse _fcResponse = FCResponse.nullCast();
  WeatherResponse _response = WeatherResponse(
      cityName: 'Unknown',
      tempInfo: TemperatureInfo(temperature: 0, feelsLike: 0),
      weatherInfo: WeatherInfo(description: '', icon: '', weatherId: 800));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Meow Weather'),
        centerTitle: true,
        actions: [
          /*
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(Icons.place),
          ),
          */
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(3),
        children: <Widget>[
          Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: AssetImage('${_response.weatherInfo.pictureUrl}'),
                    fit: BoxFit.fill),
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //if (_response != null)
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 50.0,
                            width: 200,
                            child: TextField(
                                controller: _cityTextController,
                                decoration: InputDecoration(labelText: 'Город'),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        ElevatedButton(onPressed: _search, child: Text('Найти'))
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                          height: 230.0,
                          child: Column(children: [
                            Text(
                              '${_response.tempInfo.temperature}°с',
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .apply(fontSizeFactor: 5.0),
                            ),
                            Text(
                              '${_response.weatherInfo.description}',
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .apply(fontSizeFactor: 2.0),
                            ),
                            Image.asset('${_response.weatherInfo.iconUrl}',
                                width: 50, height: 40, fit: BoxFit.fill),
                            Text(
                              'Ощущается как',
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .apply(fontSizeFactor: 1.0),
                            ),
                            Text(
                              '${_response.tempInfo.feelsLike}°с',
                              style: DefaultTextStyle.of(context)
                                  .style
                                  .apply(fontSizeFactor: 2.0),
                            )
                          ]))),
                ],
              )),
          Container(height: 200, color: Colors.white, child: chartToRun()),
          Container(
            height: 230,
            color: Colors.white,
            child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Image.asset('assets/icon/Sun_Icone.png',
                        width: 25, height: 25, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Image.asset('assets/icon/Cloud_Icone1.png',
                        width: 30, height: 25, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Image.asset('assets/icon/Rain_Icone.png',
                        width: 25, height: 25, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Image.asset('assets/icon/Sun_Icone.png',
                        width: 25, height: 25, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Image.asset('assets/icon/Storm_Icone.png',
                        width: 25, height: 25, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Image.asset('assets/icon/Cloud_Icone2.png',
                        width: 30, height: 20, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Image.asset('assets/icon/Sun_Icone.png',
                        width: 25, height: 25, fit: BoxFit.fill),
                  ),
                ]),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Ясно'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Переменная блачность'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Дождь'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Ясно'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Гроза, местами ливень'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Облачно, местами дождь'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Ясно'),
                    ),
                  ],
                ),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('18/28°с'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text('11/23°с'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('11/19°с'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('18/28°с'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('11/23°с'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('11/19°с'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('11/19°с'),
                  ),
                ])
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    final castResponse =
        await _fcService.getWeather(_cityTextController.text, 7);
    //print(castResponse.tempTab);

    setState(() {
      _response = response;
      _fcResponse = castResponse;
    });
  }

  Widget chartToRun() {
    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartData chartData;
    ChartOptions chartOptions = const ChartOptions();
    // Example with side effects cannot be simply pasted to your code, as the _ExampleSideEffects is private
    // This example shows the result with sufficient space to show all labels, but not enough to be horizontal;
    // The iterative layout strategy makes the labels to tilt but show fully.
    chartData = ChartData(
      dataRows: [_fcResponse.tempTab[0]],
      xUserLabels: _fcResponse.timeTab,
      dataRowsLegends: [_fcResponse.nameTab[0]],
      chartOptions: chartOptions,
    );
    //exampleSideEffects = _ExampleSideEffects()..leftSqueezeText='>>'.. rightSqueezeText='<' * 3;
    var verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    var verticalBarChart = VerticalBarChart(
      painter: VerticalBarChartPainter(
        verticalBarChartContainer: verticalBarChartContainer,
      ),
    );
    return verticalBarChart;
  }
}
