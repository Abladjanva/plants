import 'package:flutter/material.dart';
import 'package:plants/db.dart';
import 'package:plants/plants_cash.dart';
import 'package:plants/plants_pin.dart';
import 'package:plants/plants_third_page.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlantsInfo extends StatefulWidget {
  final Map<String, dynamic>? plantssInfo;
  final int index;
  const PlantsInfo({super.key, required this.plantssInfo, required this.index});

  @override
  State<PlantsInfo> createState() => _PlantsInfoState();
}

class _PlantsInfoState extends State<PlantsInfo> {
  bool isFavorited = false;
  int count = 1;
  Map<String, dynamic>? plant;

  Future<void> fetchPlantData() async {
    final response = await http
        .get(Uri.parse('https://api.sampleapis.com/health/professions'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      if (widget.index < data.length) {
        setState(() {
          plant = data[widget.index];
        });
        final box = Hive.box('favorites');
        isFavorited = box.containsKey(plant!['short_name']);
      }
    }
  }

  void pFavorite() {
    final box = Hive.box('favorites');
    final key = plant?['short_name'];
    if (key != null) {
      setState(() {
        isFavorited = !isFavorited;
        if (isFavorited) {
          box.put(key, plant);
        } else {
          box.delete(key);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPlantData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A6D49),
        leading: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlantsThirdPage())),
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
      body: plant == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          plant?['short_name'] ?? '',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF4A6D49),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 350,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: Image.asset(db.favorites[widget.index]['image']),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          plant?['long_name'] ?? '',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4A6D49)),
                        ),
                        IconButton(
                          onPressed: pFavorite,
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                isFavorited ? Color(0xFF4A6D49) : Colors.grey,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Size:",
                            style: TextStyle(
                                color: Color(0xFF4A6D49),
                                fontSize: 17,
                                fontWeight: FontWeight.w400)),
                        ...['6 inch', '8 inch', '10 inch']
                            .map((size) => Container(
                                  height: 40,
                                  width: 85,
                                  color: Colors.grey.shade300,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Center(
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                            color: Color(0xFF4A6D49),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Quantity:",
                            style: TextStyle(
                                color: Color(0xFF4A6D49),
                                fontSize: 17,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade300),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                onPressed: () {
                                  setState(() {
                                    if (count > 1) count--;
                                  });
                                },
                                icon: Icon(Icons.remove,
                                    size: 15, color: Color(0xFF4A6D49)),
                              ),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                  color: Color(0xFF4A6D49),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                onPressed: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                icon: Icon(Icons.add,
                                    size: 15, color: Color(0xFF4A6D49)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlantsCash()));
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xFF4A6D49),
                          ),
                          child: Center(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
