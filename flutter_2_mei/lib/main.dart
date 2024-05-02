import 'package:flutter/material.dart';
import 'activity_model.dart'; // Import kelas ActivityModel
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ActivityModel>(
          create: (context) => ActivityModel(aktivitas: "-", jenis: "-"),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Consumer<ActivityModel>(
            builder: (context, aktivitas, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<ActivityModel>(context, listen: false)
                            .fetchData();
                      },
                      child: const Text("Saya bosan ..."),
                    ),
                  ),
                  Text(aktivitas.aktivitas),
                  Text("Jenis: ${aktivitas.jenis}")
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
