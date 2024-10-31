import 'package:flutter/material.dart';

class TextPreview extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextPreview({Key? key, required this.text, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: fontSize),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context, 'ok');
                  },
                  child: Text('OK', style: TextStyle(fontSize: 11),),
                ),
                SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: Text('Cancel', style: TextStyle(fontSize: 11),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
