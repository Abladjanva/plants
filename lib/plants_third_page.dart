import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plants/db.dart';
import 'package:plants/plants_first_page.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'plant_provider.dart';
import 'plants_Info.dart';

class PlantsThirdPage extends StatefulWidget {
  const PlantsThirdPage({super.key});

  @override
  State<PlantsThirdPage> createState() => _PlantsThirdPageState();
}

class _PlantsThirdPageState extends State<PlantsThirdPage> {
  Future<List<dynamic>> fetchPlants() async {
    final response = await http
        .get(Uri.parse('https://api.sampleapis.com/health/professions'));
    final List data = json.decode(response.body);
    return data.where((e) => [1, 2, 3, 4].contains(e['id'])).toList();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<PlantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A6D49),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => MovieFirstPage())),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Text(
                      "Popular Items",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF4A6D49),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.menu, color: Color(0xFF4A6D49)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "New & Featured",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF4A6D49),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: fetchPlants(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final items = snapshot.data!;

                return GridView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.all(30),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 25,
                    childAspectRatio: 3 / 4.8,
                  ),
                  itemBuilder: (context, index) {
                    final plant = items[index];
                    final isFav = favoritesProvider.isFavorite(plant['id']);

                    return Card(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlantsInfo(
                                    plantssInfo: plant,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Container(
                                  height: 250,
                                  width: 195,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(35),
                                    child: const Center(
                                      child: Icon(
                                        Icons.medical_services,
                                        color: Color(0xFF4A6D49),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: SizedBox(
                              
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          plant['short_name'] ?? '',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xFF4A6D49),
                                          ),
                                        ),
                                        SizedBox(
                                          child: Text(
                                            plant['long_name'] ?? '',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xFF4A6D49),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        favoritesProvider
                                            .toggleFavorite(plant['id']);
                                      },
                                      icon: Icon(
                                        isFav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isFav
                                            ? const Color(0xFF4A6D49)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
