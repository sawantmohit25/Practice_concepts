import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  TextEditingController urlController=TextEditingController();
  VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    videoPlayerController.dispose();
    urlController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Video Player'),
        centerTitle: true,
      ),
      body:Container(
        child:Column(
          children: [
            TextField(
              controller:urlController,
            ),
            SizedBox(height:20),
            VideoPlayerWidget(videoPlayerController:videoPlayerController,),
            SizedBox(height: 20,),
            RaisedButton(onPressed:(){
              videoPlayerController=VideoPlayerController.network(urlController.text)
                ..addListener(()=> setState((){}))
                ..setLooping(true)
                ..initialize().then((_) =>videoPlayerController.play());
              urlController.clear();
            },child:Text('Submit'),)
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  VideoPlayerController videoPlayerController;
  VideoPlayerWidget({@required this.videoPlayerController});
  @override
  Widget build(BuildContext context) {
    return videoPlayerController!=null&& videoPlayerController.value.initialized?
    Container(child:AspectRatio(aspectRatio:videoPlayerController.value.aspectRatio,child: VideoPlayer(videoPlayerController))):
    Container(child:Text('No Video'));
  }
}

