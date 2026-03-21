import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(NovaxApp());

class NovaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOVAX Player',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: NovaxPlayer(),
        ),
      ),
    );
  }
}

class NovaxPlayer extends StatefulWidget {
  @override
  _NovaxPlayerState createState() => _NovaxPlayerState();
}

class _NovaxPlayerState extends State<NovaxPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    // هذا رابط تجريبي للبث المباشر (M3U8) ليتأكد النظام من عمل المشغل
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(flickManager: flickManager);
  }
}
