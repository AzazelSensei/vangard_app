import 'package:flutter/material.dart';

class CompetitionPage extends StatefulWidget {
  const CompetitionPage({Key? key}) : super(key: key);

  @override
  _CompetitionPageState createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff9962DB),
          title: Text("Competition Page",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert_sharp),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('There are no notifications to display.')));
              },
            ),
          ]),
      body: Center(
          child: Text("Home Page",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
      ),

    );
  }
}
