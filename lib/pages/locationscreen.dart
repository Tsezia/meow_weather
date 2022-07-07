import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 70.0,
                width: 200,
                child: TextField(
                    decoration: InputDecoration(labelText: 'Город'),
                    textAlign: TextAlign.center),
              ),
            ),
            ElevatedButton(onPressed: null, child: Text('Поиск'))
          ],
        ),
      ),
    );
  }

}