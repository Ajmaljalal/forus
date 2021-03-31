// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class GridViewImageContainer extends StatelessWidget {
//   final List images;
//   GridViewImageContainer({required this.images});
//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGridView.count(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       crossAxisCount: 4,
//       children: images.map<Widget>((image) {
//         return CachedNetworkImage(
//           filterQuality: FilterQuality.medium,
//           imageUrl: image,
//           fit: BoxFit.none,
//         );
//       }).toList(),
//       staggeredTiles: [...buildTiles(images.length)],
//       mainAxisSpacing: 1.0,
//       crossAxisSpacing: 1.0, // add some space
//     );
//   }

//   List<dynamic> buildTiles(count) {
//     List tiles = [];
//     if (count == 1) {
//       tiles = [StaggeredTile.count(6, 3)];
//     }
//     if (count == 2) {
//       tiles = [
//         StaggeredTile.count(2, 2),
//         StaggeredTile.count(2, 2),
//       ];
//     }

//     if (count == 3) {
//       tiles = [
//         StaggeredTile.count(5, 2),
//         StaggeredTile.count(2, 1),
//         StaggeredTile.count(2, 1),
//       ];
//     }

//     if (count == 4) {
//       tiles = [
//         StaggeredTile.count(2, 2),
//         StaggeredTile.count(2, 2),
//         StaggeredTile.count(2, 2),
//         StaggeredTile.count(2, 2),
//       ];
//     }

//     if (count == 5) {
//       tiles = [
//         StaggeredTile.count(2, 2),
//         StaggeredTile.count(1, 1),
//         StaggeredTile.count(1, 1),
//         StaggeredTile.count(1, 1),
//         StaggeredTile.count(1, 1),
//       ];
//     }

//     if (count == 6) {
//       tiles = [
//         StaggeredTile.count(2, 2),
//         StaggeredTile.count(2, 2),
//         StaggeredTile.count(1, 1),
//         StaggeredTile.count(1, 1),
//         StaggeredTile.count(1, 1),
//         StaggeredTile.count(1, 1),
//       ];
//     }
//     return tiles;
//   }
// }
