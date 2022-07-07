import 'package:flutter/material.dart';
import 'package:meow_weather/pages/LocationScreen.dart';
import 'package:meow_weather/pages/settingsscreen.dart';
import 'package:meow_weather/data/data_service.dart';

import 'package:meow_weather/data/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
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
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(Icons.place),
          ),
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
                      padding: EdgeInsets.symmetric(vertical: 20),
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
                            /*
                            Icon(
                              Icons.sunny,
                              color: Colors.pink,
                              size: 40.0,
                            ),*/
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
          Container(
              height: 200,
              color: Colors.white,
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: Container(
                      height: 100,
                      width: 50,
                      color: Colors.green,
                      child: Text('34%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: Container(
                      height: 100,
                      width: 50,
                      color: Colors.green,
                      child: Text('34%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: Container(
                      height: 100,
                      width: 50,
                      color: Colors.green,
                      child: Text('34%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    )),
              ])

              /*
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(children: [
                    (
                        height: 50,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        )),
                    Text('Какой-то текст'),
                    Text('Какой-то текст'),
                    Text('Какой-то текст'),
                  ]))
              */
              ),
          Container(
            height: 230,
            color: Colors.white,
            child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Icon(
                      Icons.sunny,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Icon(
                      Icons.cloud,
                      color: Colors.grey,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Icon(
                      Icons.beach_access,
                      color: Colors.blue,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Icon(
                      Icons.sunny,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Icon(
                      Icons.sunny,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Icon(
                      Icons.sunny,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Icon(
                      Icons.sunny,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                  ),
                ]),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Какой-то текст'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Какой-то текст'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Какой-то текст'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Какой-то текст'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Какой-то текст'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Какой-то текст'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text('Какой-то текст'),
                    ),
                  ],
                ),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('18/28'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text('11/23'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('11/19'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('18/28'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('11/23'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('11/19'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text('11/19'),
                  ),
                ])
              ]),
            ),
          ),
        ],
      ),

      /*
      LayoutBuilder(builder: (context, constraints) {
        return Container(
            child: Column(children: [
          Expanded(
              flex: 4,
              child: Stack(fit: StackFit.expand, children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: const DecorationImage(
                          image: AssetImage('assets/cloud_cat.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //if (_response != null)
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  height: 70.0,
                                  width: 200,
                                  child: TextField(
                                      decoration:
                                          InputDecoration(labelText: 'Город'),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: _search, child: Text('Найти'))
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: SizedBox(
                              height: 200.0,
                              child: Text(
                                '${_response.tempInfo.temperature}°с',
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .apply(fontSizeFactor: 6.0),
                              ),
                            )),
                        /*
                        ElevatedButton(
                            onPressed: _search, child: Text('Обновить'))*/
                      ],
                    )),
              ])),
          Container(
            width: constraints.maxHeight,
            color: Colors.white,
            height: 100,
          ),
        ]));
      }),
      */
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
