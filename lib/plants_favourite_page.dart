import 'package:flutter/material.dart';

class PlantsFavouritePage extends StatefulWidget {
  const PlantsFavouritePage({super.key});

  @override
  State<PlantsFavouritePage> createState() => _PlantsFavouritePageState();
}

class _PlantsFavouritePageState extends State<PlantsFavouritePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFF4A6D49),
        //   leading: IconButton(
        //       onPressed: () => Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Button())),
        //       icon: Icon(
        //         Icons.arrow_back_ios,
        //         color: Colors.white,
        //       )),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 10.0),
        //       child: Icon(
        //         Icons.search,
        //         color: Colors.white,
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(right: 10),
        //       child: Icon(
        //         Icons.more_vert,
        //         color: Colors.white,
        //       ),
        //     )
        //   ],
        // ),
        // body: SingleChildScrollView(
        //     scrollDirection: Axis.vertical,
        //     child: Padding(
        //         padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
        //         child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             spacing: 20,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 30.0),
        //                 child: Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: Text(
        //                     "Your favourite",
        //                     style: TextStyle(
        //                       fontSize: 30,
        //                       color: Color(0xFF4A6D49),
        //                       fontWeight: FontWeight.w900,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               Align(
        //                 alignment: Alignment.centerLeft,
        //                 child: Text(
        //                   "Items",
        //                   style: TextStyle(
        //                     fontSize: 20,
        //                     fontWeight: FontWeight.w500,
        //                     color: Color(0xFF4A6D49),
        //                   ),
        //                 ),
        //               ),
        //               Expanded(
        //                   child: GridView.builder(
        //                       itemCount: db.plantsInfo.length,
        //                       gridDelegate:
        //                           SliverGridDelegateWithFixedCrossAxisCount(
        //                               crossAxisCount: 1,
        //                               mainAxisSpacing: 20,
        //                               childAspectRatio: 4.5 / 3,
        //                               crossAxisSpacing: 20),
        //                       itemBuilder: (context, index) {
        //                         return Card(
        //                           child: Row(
        //                             children: [
        //                               ClipRRect(
        //                                 borderRadius: BorderRadius.circular(16),
        //                                 child: Image.asset(db.plantsInfo[index]['image'], height: 100, width: 100,fit: BoxFit.cover,),
        //                               )
        //                             ],
        //                           ),
        //                         );
        //                       })),
        //             ])))
         );
  }
}
