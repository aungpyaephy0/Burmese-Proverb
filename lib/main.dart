// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/proverb_data.dart';
// import 'package:flutter_application_1/model/proverb.dart';

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
  List<Map<String, dynamic>> foundProverb = [];
  @override
  void initState() {
   foundProverb = allProverbs;
    super.initState();
  }
  
  void filterProverb(String keywords) {
    List<Map<String, dynamic>> searchResults = [];
    if (keywords.isEmpty) {
      searchResults = allProverbs;
    } else {
      searchResults = allProverbs
          .where((allProverbs) =>
              allProverbs["name"].toLowerCase().contains(keywords.toLowerCase()))
          .toList();
    }
  
    setState(() {
      foundProverb = searchResults;
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 220, 233),
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
            height: 15.0,
          ),
          TextField(
           onChanged: (value) => filterProverb(value),
            style: TextStyle(
              fontSize: 13.1,
              color: Color.fromARGB(255, 13, 14, 14),
            ),
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Color.fromARGB(255, 21, 83, 112),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: foundProverb.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(2),
                      // leading: Text(
                      //   foundProverb[index]["id"].toString(),
                      // ),
                      title: Text(
                        foundProverb[index]["name"],
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
