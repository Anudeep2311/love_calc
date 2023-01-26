import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final male = TextEditingController();
  final female = TextEditingController();
  var random = new Random();

  void press(BuildContext ctx) {
    final text1 = male.text;
    final text2 = female.text;

    if (text1 != "" || text2 != "" && text1 == "" || text2 == "") {
      final snackbar = SnackBar(
        content: Text(
          "                Love Guru Say's ${random.nextInt(100)}",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Color(0xffE9B4B4),
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text(
          "                Love Guru Needs Name",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Color(0xffE9B4B4),
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    }
    reset();
  }

  void reset() {
    setState(() {
      male.text = "";
      female.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (ctx) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network(
                    "https://images.unsplash.com/photo-1518050346340-aa2ec3bb424b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80",
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100, right: 100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffEAB5B5)),
                    child: TextField(
                      controller: male,
                      decoration: InputDecoration(
                          hintText: "His Name",
                          prefixIcon: Icon(
                            FontAwesomeIcons.male,
                            color: Colors.black12,
                          ),
                          contentPadding: EdgeInsets.only(left: 10, top: 12),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100, right: 100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffEAB5B5)),
                    child: TextField(
                      controller: female,
                      decoration: InputDecoration(
                          hintText: "Her Name",
                          prefixIcon: Icon(
                            FontAwesomeIcons.female,
                            color: Colors.black12,
                          ),
                          contentPadding: EdgeInsets.only(left: 10, top: 12),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontStyle: FontStyle.italic)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () => press(ctx),
                    child: Container(
                      height: 35,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xffEC7575)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 23, top: 7),
                        child: Text(
                          "Let's Calculate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
