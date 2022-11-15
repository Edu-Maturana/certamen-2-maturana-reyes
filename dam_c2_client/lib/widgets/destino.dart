// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:mobile_project/modelos/modelo_destino.dart';

// class widgetDestino extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text('Destinos Populares',
//                   style: TextStyle(
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.5)),
//               GestureDetector(
//                 onTap: () => print('Ver todos'),
//                 child: Text(
//                   'Ver todos',
//                   style: TextStyle(
//                       color: Theme.of(context).primaryColor,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 1.0),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//             height: 300.0,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data['data'].length,
//               itemBuilder: (BuildContext context, int index) {
//                 Destinos destino = destinos[index];
//                 return Container(
//                   margin: EdgeInsets.all(10.0),
//                   width: 210.0,
//                   child: Stack(
//                     alignment: Alignment.topCenter,
//                     children: <Widget>[
//                       Positioned(
//                         bottom: 15.0,
//                         child: Container(
//                           height: 120.0,
//                           width: 200.0,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.0)),
//                           child: Padding(
//                             padding: EdgeInsets.all(10.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text('Detalles',
//                                     style: TextStyle(
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.w600,
//                                         letterSpacing: 1.2)),
//                                 Text(destino.descripcion,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               offset: Offset(0.0, 2.0),
//                               blurRadius: 6.0,
//                             ),
//                           ],
//                         ),
//                         child: Stack(
//                           children: <Widget>[
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(20.0),
//                               child: Image(
//                                 height: 180.0,
//                                 width: 180.0,
//                                 image: AssetImage(destino.imageUrl),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             Positioned(
//                               left: 10.0,
//                               bottom: 10.0,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text(
//                                     destino.ciudad,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 24.0,
//                                       fontWeight: FontWeight.w600,
//                                       letterSpacing: 1.2,
//                                     ),
//                                   ),
//                                   Row(
//                                     children: <Widget>[
//                                       Icon(FontAwesomeIcons.locationArrow,
//                                           size: 10.0, color: Colors.white),
//                                       Text(
//                                         destino.pais,
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             )),
//       ],
//     );
//   }
// }
