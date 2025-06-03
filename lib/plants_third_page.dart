import 'package:flutter/material.dart';
import 'package:plants/plants_first_page.dart';
import 'package:provider/provider.dart';

import 'plant_provider.dart';

class PlantsThirdPage extends StatefulWidget {
  const PlantsThirdPage({super.key});

  @override
  State<PlantsThirdPage> createState() => _PlantsThirdPageState();
}

class _PlantsThirdPageState extends State<PlantsThirdPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PlantProvider>().fetchPlants();
    });
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
            child: Consumer<PlantProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
                if (provider.error != null) {
                  return Center(child: Text(provider.error!));
                }
                return GridView.builder(
                  itemCount: provider.plants.length,
                  padding: const EdgeInsets.all(30),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 25,
                    childAspectRatio: 3 / 4.8,
                  ),
                  itemBuilder: (context, index) {
                    final plant = provider.plants[index];
                    final isFav = favoritesProvider.isFavorite(plant.id);

                    return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PlantsInfo(
                        //       plantssInfo: plant,
                        //       index: index,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Card(
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.0),
                                  ),
                                  child: Image(
                                    image: NetworkImage(
                                        'https://picsum.photos/200'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        plant.shortName,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF4A6D49),
                                        ),
                                      ),
                                      Text(
                                        plant.longName,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF4A6D49),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  favoritesProvider.toggleFavorite(plant.id);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: isFav
                                      ? const Color(0xFF4A6D49)
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
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
