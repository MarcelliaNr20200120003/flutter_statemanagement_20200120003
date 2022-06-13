import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tugas 8",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      initialRoute: '/pertama',
      routes: {
        '/pertama': (context) => const HalamanSatu(title: 'Halaman Pertama'),
        '/kedua': (context) => const HalamanDua(),
        '/ketiga': (context) => const HalamanTiga(),
      },
    );
  }
}

class HalamanSatu extends StatefulWidget {
  const HalamanSatu({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  int _counter = 0;
  int _selectedScreenIndex = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
          child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                child: Icon(Icons.navigate_before),
                onPressed: () {
                  Navigator.pushNamed(context, '/kedua',
                      arguments: Data('$_counter', 'Halaman Kedua'));
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                child: Icon(Icons.navigate_next),
                onPressed: () {
                  Navigator.pushNamed(context, '/ketiga',
                      arguments: Data('$_counter', 'Halaman Ketiga'));
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class HalamanDua extends StatelessWidget {
  const HalamanDua({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count,
                style: const TextStyle(
                    fontSize: 50, color: Color.fromARGB(255, 95, 95, 95))),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              child: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class HalamanTiga extends StatelessWidget {
  const HalamanTiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count,
                style: const TextStyle(
                    fontSize: 50, color: Color.fromARGB(255, 95, 95, 95))),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              child: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class Data {
  final String title;
  final String count;

  Data(this.count, this.title);
}
