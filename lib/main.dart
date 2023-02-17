import 'package:flutter/material.dart';
//se importa paquete
import 'package:english_words/english_words.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //declaracion de variable para una palabra aleatoria
    final wordPair = WordPair.random();

    return const MaterialApp(

      title: ' Generador de Nombres ',
      home: RandomWords(),
    );
  }
}
class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  RandomWordsState createState() => RandomWordsState(); }
class RandomWordsState extends State<RandomWords> {
  Future<RandomWordsState> createState() async => RandomWordsState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de Nombres'),//titulo que va en el banner
      ),
      body: _buildSuggestions(),
    );
  }
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder:  (context, i) {
      if (i.isOdd) return const Divider();


    final index = i ~/ 2;
    if (index >= _suggestions.length) {
    _suggestions.addAll(generateWordPairs().take(10));
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