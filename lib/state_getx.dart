import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      title: 'Tugas 8',
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text("Halaman Pertama")),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Obx(() => Text("${c.count}")),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment),

      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                child: ElevatedButton(
                    child: Icon(Icons.navigate_before),
                    onPressed: () => Get.to(Kedua())),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: ElevatedButton(
                    child: Icon(Icons.navigate_next),
                    onPressed: () => Get.to(Ketiga())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Kedua extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Kedua")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "${c.count}",
            style: const TextStyle(
                fontSize: 50, color: Color.fromARGB(255, 95, 95, 95)),
          )),
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

class Ketiga extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: Text("Halaman Ketiga")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "${c.count}",
              style: const TextStyle(
                  fontSize: 50, color: Color.fromARGB(255, 95, 95, 95)),
            )),
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
        ));
  }
}
