import 'package:flutter/material.dart';
import 'package:plants/plants_pin.dart';

class PlantsCash extends StatefulWidget {
  const PlantsCash({super.key});

  @override
  State<PlantsCash> createState() => _PlantsCashState();
}

int groupValue = -1;

class _PlantsCashState extends State<PlantsCash> {
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: EdgeInsets.fromLTRB(30, 25, 30, 0),
              child: Column(
                  spacing: 30,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF4A6D49),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Text(
                      "Select the payment method you want to use",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    Column(spacing: 40, children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlantsPin()));
                          });
                        },
                        child: Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 30, 0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/paytm.jpg',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Paytm",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Radio<int>(
                                    value: 1,
                                    groupValue: groupValue,
                                    activeColor: Color(0xFF4A6D49),
                                    onChanged: (value) {
                                      setState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 30, 0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'assets/images/google.jpg',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Google Pay",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Radio<int>(
                                    value: 2,
                                    groupValue: groupValue,
                                    activeColor: Color(0xFF4A6D49),
                                    onChanged: (value) {
                                      setState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 30, 0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'assets/images/paypal.jpg',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "PayPal",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Radio<int>(
                                    value: 3,
                                    groupValue: groupValue,
                                    activeColor: Color(0xFF4A6D49),
                                    onChanged: (value) {
                                      setState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 30, 0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'assets/images/creditcard.jpg',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  ".... .... .... .... xxxx",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Radio<int>(
                                    value: 4,
                                    groupValue: groupValue,
                                    activeColor: Color(0xFF4A6D49),
                                    onChanged: (value) {
                                      setState(() {
                                        groupValue = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlantsPin()));
                        });
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(15, 40, 15, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF4A6D49)),
                        child: Center(
                          child: Text(
                            'Confirm Payment',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    )
                  ])),
        ));
  }
}
