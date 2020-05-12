import 'package:flutter/material.dart';
import 'package:youtube_bloc/modules/video.dart';

class VideosTile extends StatelessWidget {
  final Video video;
  VideosTile(this.video);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              video.thumb,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            video.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            video.channel,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13,color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.star_border),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
