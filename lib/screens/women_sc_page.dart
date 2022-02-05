import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackviolet_submission/models/women_sc.dart';
import 'package:http/http.dart' as http;
import 'package:hackviolet_submission/datafetcher.dart';

class WomenSCPage extends StatefulWidget {
  const WomenSCPage({Key? key}) : super(key: key);

  @override
  State<WomenSCPage> createState() => _WomenSCPageState();
}

class _WomenSCPageState extends State<WomenSCPage> {
  late List<WomenSC> womenList;

  @override
  void initState() {
    super.initState();
    getWomenLocal().then((val) {
      setState(() {
        womenList = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWomenLocal(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Women In Science'),
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i in womenList)
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                //workwithOnTaprequest
                              },
                              child: ClipRRect(
                                child: Image.network(
                                  i.imageUrl,
                                  width: 400,
                                ),
                              ),
                            ),
                            Text(i.name),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Women In Science'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Loading data..."),
                  ],
                ),
              ),
            );
          }
        });
  }
}
