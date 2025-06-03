import 'package:flutter/material.dart';

class PlantsPin extends StatefulWidget {
  const PlantsPin({super.key});

  @override
  State<PlantsPin> createState() => _PlantsPinState();
}

List<String> numbers = [];

class _PlantsPinState extends State<PlantsPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4A6D49),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Enter your pin",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF4A6D49),
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "Enter your PIN to confirm payment",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Container(
                      height: 50,
                      width: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200),
                      alignment: Alignment.center,
                      child: Text(
                        numbers.isEmpty  ? "" : numbers[0],
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF4A6D49)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200),
                            alignment: Alignment.center,
                      child: Text(
                        numbers.length < 2 ? "" : numbers[1],
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF4A6D49)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200),
                            alignment: Alignment.center,
                      child: Text(
                        numbers.length < 3 ? "" : numbers[2],
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF4A6D49)),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200),
                            alignment: Alignment.center,
                      child: Text(
                        numbers.length < 4 ? "" : numbers[3],
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF4A6D49)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF4A6D49)),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        InkWell(
                          onTap: () {
                            addNumberToList("1");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            addNumberToList("2");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            addNumberToList("3");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        InkWell(
                          onTap: () {
                            addNumberToList("4");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            addNumberToList("5");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            addNumberToList("6");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "6",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        InkWell(
                          onTap: () {
                            addNumberToList("7");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "7",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            addNumberToList("8");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "8",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            addNumberToList("9");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "9",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        InkWell(
                          onTap: () {
                            addNumberToList("*");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "*",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            addNumberToList("0");
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            removeNumberFromList();
                          },
                          child: Container(
                            height: 50,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Icon(Icons.backspace_outlined),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ])));
  }

  void addNumberToList(String number) {
    setState(() {
      if (numbers.length != 4) {
        setState(() {
          numbers.add(number);
        });
      }
    });
  }

  void removeNumberFromList() {
    if (numbers.isNotEmpty) {
      setState(() {
        numbers.removeLast();
      });
    }
  }
}
