import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewScreen extends StatelessWidget {
  final String _filename;
  final String _uri;

  ImageViewScreen(this._filename, this._uri);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_filename),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(
            _uri,
          ),
        ),
      ),
    );
  }
}
