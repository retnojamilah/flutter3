import 'package:flutter/material.dart';
import 'package:flutter3/apiservice.dart';
import 'classdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Service serviceAPI = Service();
late Future<List<Data>> listData;
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    listData= serviceAPI.getAlldata();

  }
  @override
   Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: Text('Ambil Data Dari Internet'),),
        body: Container(
          child: FutureBuilder<List<Data>>(
            future: listData,
            builder: (context, snapshot){
              if (snapshot.hasData){
                List<Data> isiData = snapshot.data!;
                return ListView.builder(
                  itemCount: isiData.length,
                  itemBuilder: (context, index){
                  return ListTile(
                    title: Text(isiData[index].cnama)
                  );
                  },
              );
              } else if (snapshot.hasError){
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),

    )

    );
  }
  }
