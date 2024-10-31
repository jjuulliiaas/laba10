import 'package:flutter/material.dart';
import 'text_preview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 12.0;

  Future<void> _showDialog(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
                width: 50,
                height: 50,
              ),
              SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Previewer'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(fontSize: 12),
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                helperText: 'Enter some text',
                  helperStyle: TextStyle(fontSize: 11, color: Colors.deepPurple)
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Font size: ${_fontSize.toInt()}', style: TextStyle(fontSize: 11),),
                Expanded(
                  child: Slider(
                    value: _fontSize,
                    min: 1,
                    max: 100,
                    label: _fontSize.toInt().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _fontSize = value;
                      });
                    },
                  ),
                ),
              ]),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextPreview(
                      text: _textController.text,
                      fontSize: _fontSize,
                    ),
                  ),
                );
                if (result == 'ok') {
                  _showDialog('Cool!');
                } else if (result == 'cancel') {
                  _showDialog('Let’s try something else');
                } else {
                  _showDialog("Don't know what to say");
                }
              },
              child: Text('Preview', style: TextStyle(fontSize: 10),),
            ),
          ],
        ),
      ),
    );
  }
}
