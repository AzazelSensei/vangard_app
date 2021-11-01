import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgAlertDialog extends StatelessWidget {
  const AgAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Your Password'),
          content: const Text('Introduction send your mail.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('CONFIRM'),
            ),
          ],
        ),
      ),
      child: const Text(
        'Show Dialog',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
