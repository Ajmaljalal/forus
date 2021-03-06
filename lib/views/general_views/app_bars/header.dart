// import 'package:flutter/material.dart';

// class Header extends StatefulWidget {
//   Header({Key? key}) : super(key: key);

//   @override
//   _HeaderState createState() => _HeaderState();
// }

// class _HeaderState extends State<Header> {
//   final _borderBottom = Border(
//     bottom: BorderSide(
//       color: Colors.grey[500]!,
//       width: 0.5,
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10.0),
//       width: double.infinity,
//       height: 58.0,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 2,
//             blurRadius: 10,
//           ),
//         ],
//         border: _borderBottom,
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.fiber_manual_record_outlined,
//                 size: 50.0,
//                 color: Colors.indigo,
//               ),
//               SizedBox(width: 10.0),
//               Container(
//                 width: 250.0,
//                 height: 35.0,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 242, 243, 247),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: TextFormField(
//                   textAlignVertical: TextAlignVertical.center,
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       prefixIcon: Icon(Icons.search),
//                       labelText: 'Search...'),
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             flex: 2,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Icon(
//                   Icons.add_circle_rounded,
//                   size: 33.0,
//                   color: Colors.grey[400],
//                 ),
//                 SizedBox(width: 20.0),
//                 Icon(
//                   Icons.person_add_rounded,
//                   size: 33.0,
//                   color: Colors.grey[400],
//                 ),
//                 SizedBox(width: 20.0),
//                 Icon(
//                   Icons.notifications,
//                   size: 33.0,
//                   color: Colors.grey[400],
//                 ),
//                 SizedBox(width: 20.0),
//                 Icon(
//                   Icons.arrow_drop_down_circle_rounded,
//                   size: 33.0,
//                   color: Colors.grey[400],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
