import 'package:flutter/material.dart';
import 'package:meow_weather/pages/LocationScreen.dart';
import 'pages/homescreen.dart';
import 'pages/settingsscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => MainScreen(),
        '/homes': (_) => HomeScreen(),
        '/setting': (_) => SettingScreen(),
        //'/location': (_) => LocationScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    //LocationScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Прогноз',
          ),
          /*
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Выбрать место',
          ),
          */
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
