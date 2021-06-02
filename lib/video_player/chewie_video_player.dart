import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  const ChewieListItem({Key key,@required this.videoPlayerController, this.looping}) : super(key: key);
  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController chewieController;
  @override
  void initState() {
    chewieController=ChewieController(
      videoPlayerController:widget.videoPlayerController,
      aspectRatio:16/9,
      autoInitialize: true,
      errorBuilder:(context,errorMessage){
        return Center(child:Text(errorMessage,style:TextStyle(color:Colors.white),),);
      },
    );
    super.initState();
  }
  @override
  void dispose() {
    chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio:16/9,
        child: Chewie(
          controller:chewieController,
        ),
      ),
    );
  }
}

