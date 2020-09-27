import 'package:fchan/entities/post.dart';
import 'package:fchan/extensions/build_context_extensions.dart';
import 'package:fchan/extensions/duration_extensions.dart';
import 'package:fchan/logic/widgets/cached_network_image_with_loader.dart';
import 'package:fchan/logic/widgets/html_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post _post;

  PostWidget(this._post);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "${_post.no} (${_post.timeFromPublish.formatToTime()})",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      if (_post.imageUrl != null)
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "${_post.ext} (${_post.imageWidth}x${_post.imageHeight})",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // TODO: add post without image handling
                PopupMenuButton<PostPopupMenuAction>(
                  itemBuilder: (context) => PostPopupMenuAction.values
                      .map((e) {
                        return PopupMenuItem<PostPopupMenuAction>(
                          value: e,
                          child: Text(e.toString()),
                        );
                      })
                      .toList(),
                  onSelected: (postPopupMenuAction) async {
                    switch (postPopupMenuAction) {
                      case PostPopupMenuAction.saveImageToGallery:
                        break;
                    }
                  },
                  child: Icon(
                    Icons.more_vert,
                  ),
                ),
              ],
            ),
            // TODO: null?
            if (_post.replies != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  '${_post.replies} ${_post.replies == 1 ? context.fChanWords().commonReplyText : context.fChanWords().commonRepliesText}',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    color: Colors.red[700],
                  ),
                ),
              ),
            if (_post.imageUrl != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: CachedNetworkImageWithLoader(
                  _post.imageUrl,
                  _post.imageThumbnailWidth.toDouble(),
                  _post.imageThumbnailHeight.toDouble(),
                ),
              ),
            if (_post.sub != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: HtmlTextWidget(
                  _post.sub,
                ),
              ),
            if (_post.com != null)
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: HtmlTextWidget(
                  _post.com,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

enum PostPopupMenuAction {
  saveImageToGallery,
}