import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(App2());
}

class App2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Kedua",
      home: Scaffold(
        appBar: AppBar(title: Text("App Dua")),
        body: Row(
          children: [
          Expanded(
            flex: 5,
            child: Container(
              color: CupertinoColors.systemTeal,
              child: Text("gambar"),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(children: [
              Expanded(
                child:  Row(children: [
                Expanded(flex: 5, child: Container(color: CupertinoColors.systemBlue)),
                Expanded(flex: 5, child: Container(color: CupertinoColors.systemGreen,))
              ],)),
              Expanded(child: Container(color: CupertinoColors.systemYellow)),
            ],
            )
          )
        ],
        ),
      )
    );
    
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BigBikers',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Big Bike'),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
  }



  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}