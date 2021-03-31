import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forus/widgets/circled_button.dart';

class PostImagesWeb extends StatefulWidget {
  final List<String> images;
  const PostImagesWeb({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  PostImagesWebState createState() => PostImagesWebState();
}

class PostImagesWebState extends State<PostImagesWeb> {
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

  void _onImageChange(bool goBack) {
    if (_currentIndex == 0 && goBack) {
      return;
    }
    if (_currentIndex == widget.images.length - 1 && !goBack) {
      return;
    }

    if (_currentIndex < widget.images.length && !goBack) {
      setState(() {
        _currentIndex = _currentIndex + 1;
      });
    }

    if (_currentIndex < widget.images.length && goBack) {
      setState(() {
        _currentIndex = _currentIndex - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _isEmpty = widget.images.length < 1 ? true : false;
    final _isMulti = widget.images.length > 1 ? true : false;
    if (_isEmpty) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          _imagesList.length > 0
              ? _imagesList[_currentIndex]
              : const SizedBox.shrink(),
          _isMulti && _currentIndex != 0
              ? _buildArrowButton(goBack: true)
              : const SizedBox.shrink(),
          _isMulti && _currentIndex != widget.images.length - 1
              ? _buildArrowButton(goBack: false)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildArrowButton({required bool goBack}) {
    return Positioned.fill(
      child: Align(
        alignment: goBack ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleButton(
            onPressed: () {
              _onImageChange(goBack);
            },
            icon: goBack
                ? Icons.arrow_back_ios_rounded
                : Icons.arrow_forward_ios_rounded,
            iconSize: 10.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer({required String image}) {
    return Container(
      width: double.infinity,
      child: RepaintBoundary(
        child: CachedNetworkImage(
          filterQuality: FilterQuality.medium,
          imageUrl: image,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
