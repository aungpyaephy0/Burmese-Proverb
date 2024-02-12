// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/proverb_data.dart';
import 'package:flutter_application_1/model/proverb.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchProverb(),
    );
  }
}

class SearchProverb extends StatefulWidget {
  const SearchProverb({super.key});

  @override
  State<SearchProverb> createState() => _SearchProverbState();
}

class _SearchProverbState extends State<SearchProverb> {

  List<Proverb> proverbs = allProverb;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 92, 112, 146),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Burmese Proverb",
          style: TextStyle(
            color: Color.fromARGB(255, 8, 36, 50),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0,
          ),
          TextField(
            style: TextStyle(
              fontSize: 13.1,
              color: Color.fromARGB(255, 34, 36, 36),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 214, 220, 224),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),
              hintText: "Search...",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Color.fromARGB(255, 21, 83, 112),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: proverbs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        proverbs[index].name,
                        style: TextStyle(
                          fontSize: 12.1,
                        ),
                        
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
