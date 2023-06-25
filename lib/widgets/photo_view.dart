import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  final String imageUrl;
  PhotoViewPage( this.imageUrl);

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SizedBox(
        height: double.infinity,
        child: Hero(
          tag: 'profileImage',
          child: PhotoView(
            imageProvider: NetworkImage(widget.imageUrl),
            maxScale: PhotoViewComputedScale.covered,
            minScale: PhotoViewComputedScale.contained,

          ),
        ),
      ),
    );
  }
}