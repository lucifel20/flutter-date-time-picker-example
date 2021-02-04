import 'package:flutter/material.dart';

void main() => runApp(DateTimePickerExample());

class DateTimePickerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    const String APP_TITLE = 'Flutter Date & Time Picker Example';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      home: HomeRoute(),
    ); // MaterialApp()
  }
}

class HomeRoute extends StatefulWidget {
  @override
  _HomeRoute createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  //
  DateTime _dateTime = DateTime(DateTime.now().year);

  void datePickerButtonPressed() async {
    final DateTime result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(Duration(days: -365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() => _dateTime = DateTime(
          result.year,
          result.month,
          result.day,
          _dateTime.hour,
          _dateTime.minute,
        ));
  }

  void timePickerButtonPressed() async {
    final TimeOfDay result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() => _dateTime = DateTime(
          _dateTime.year,
          _dateTime.month,
          _dateTime.day,
          result.hour,
          result.minute,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Date and Time : $_dateTime"),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.web),
                  onPressed: datePickerButtonPressed,
                ), // IconButton(),
                IconButton(
                  icon: Icon(Icons.watch),
                  onPressed: timePickerButtonPressed,
                ), // IconButton(),
              ], // List<Widget>[]
            ), // ButtonBar()
          ], // List<Widget>[]
        ), // Column()
      ), // SafeArea()
    ); // Scaffold()
  }
}
