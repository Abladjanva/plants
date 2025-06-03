import 'package:flutter/material.dart';
import 'package:plants/button.dart';

class MovieFirstPage extends StatefulWidget {
  const MovieFirstPage({super.key});

  @override
  State<MovieFirstPage> createState() => _MovieFirstPageState();
}

class _MovieFirstPageState extends State<MovieFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 722,
                  width: 500,
                  color: Colors.black,
                  child: SizedBox(
                      height: 722,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/plantss.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
                Center(
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 300.0),
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Button(),
                              )),
                          child: Container(
                            height: 58,
                            width: 260,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFFF5F5F5)),
                            child: Center(
                                child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4C864A)),
                            )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 58,
                          width: 260,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFFF5F5F5)),
                          child: Center(
                              child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4C864A)),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
