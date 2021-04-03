import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:forus/configs/color_palette.dart';

class PostImagesMobile extends StatefulWidget {
  final List<String> images;
  const PostImagesMobile({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  PostImagesMobileState createState() => PostImagesMobileState();
}

class PostImagesMobileState extends State<PostImagesMobile> {
  int _currentIndex = 0;
  List _imagesList = const [];

  @override
  void initState() {
    super.initState();
    final imagesList = widget.images.map((image) {
      return _buildImageContainer(image: image);
    }).toList();
    setState(() {
      _imagesList = imagesList;
    });
  }

  void _onImageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 300.0,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              _onImageChange(index);
            },
            children: [..._imagesList],
          ),
          _imagesList.length > 1
              ? _buildMultiImagesIndicator()
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _buildMultiImagesIndicator() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topLeft,
        child: Card(
          color: ColorPalette.primary.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '${_currentIndex + 1}\/${widget.images.length}',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer({required String image}) {
    return RepaintBoundary(
      child: CachedNetworkImage(
        filterQuality: FilterQuality.medium,
        imageUrl: image,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
