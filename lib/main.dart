import 'package:flutter/material.dart';
import 'package:spotify_clone/core/utils/trl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadTranslations('de');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentLanguage,
      builder: (context, lang, _) {
        return MaterialApp(
          title: trl('title'),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MyHomePage(title: trl('home_page_title')),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  void _switchLanguage() async {
    final newLang = currentLanguage.value == 'de' ? 'en' : 'de';
    await loadTranslations(newLang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: _switchLanguage,
            tooltip: 'Switch Language',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(trl('counter_info')),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: trl('button_tooltip'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
