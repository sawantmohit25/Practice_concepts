import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
class PlayAudio extends StatefulWidget {
  String fileName;
  PlayAudio({this.fileName});
   @override
  _PlayAudioState createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {

  bool playing=false,onClicked=false;
  IconData playButton=Icons.play_arrow;
  IconData likeButton=Icons.favorite_border;

  AudioPlayer audioPlayer;
  // AudioCache audioCache;

  Duration position=Duration();
  Duration musicLength=Duration();



  Widget slider(){
    return Container(
      width:265,
      child: Slider.adaptive(
        inactiveColor:Colors.grey[600],
        activeColor: Colors.white,
        value:position.inSeconds.toDouble(),
        max:musicLength.inSeconds.toDouble(),
        onChanged:(val){
          seekToSec(val.toInt());
        },
      ),
    );
  }

  void seekToSec(int sec) {
    Duration newPosition=Duration(seconds:sec);
    audioPlayer.seek(newPosition);
  }

  @override
  void initState() {
    audioPlayer=AudioPlayer();
    // audioCache=AudioCache(fixedPlayer:audioPlayer);

    audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        musicLength=d;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        position=p;
      });
    });

    // audioCache.load('faded.mp3');
    super.initState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Column(
          children: [
            Text('Music Player',style:TextStyle(fontSize:20.0),),
            Text(widget.fileName!=null?'${widget.fileName}.mp3':'',style:TextStyle(fontSize:15.0,fontWeight:FontWeight.bold),)
          ],
        ),
        centerTitle:true,
        elevation:0,
        backgroundColor:Colors.grey,
        leading:Icon(Icons.keyboard_arrow_down_outlined,size:40,),
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body:Container(
        decoration:BoxDecoration(
            gradient:LinearGradient(
              colors: [
                Colors.grey,
                Colors.black
              ],
              begin:Alignment.topCenter,
              end:Alignment.bottomCenter,
            )
        ),
        child:Padding(
          padding:EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
          child:Column(
            children: [
              Container(
                child:Image.asset('assets/musicplayer.png'),
              ),
              SizedBox(height:50.0,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      Text('Faded',style:TextStyle(fontSize:25.0,color:Colors.white,fontWeight:FontWeight.bold),),
                    ],
                  ),
                  IconButton(onPressed:(){
                    if(!onClicked){
                      setState(() {
                        likeButton=Icons.favorite;
                        onClicked=true;
                      });
                      Fluttertoast.showToast(
                          msg:'Added to liked songs.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.black
                      );
                    }
                    else{
                      setState(() {
                        likeButton=Icons.favorite_border;
                        onClicked=false;
                      });
                      Fluttertoast.showToast(
                          msg:'Removed from liked songs.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.black
                      );
                    }
                  },icon:Icon(likeButton,color:Colors.white,))
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Text('Alan Walker',style:TextStyle(fontSize:20,color:Colors.white38),),
                ],
              ),
              SizedBox(height:20,),
              Row(
                children: [
                  Text('${position.inMinutes}:${position.inSeconds.remainder(60)}',style:TextStyle(color:Colors.white),),
                  slider(),
                  Text('${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}',style:TextStyle(color:Colors.white),),
                ],
              ),
              SizedBox(height:20,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  Icon(Icons.shuffle,size: 25,color:Colors.white,),
                  IconButton(icon:Icon(Icons.skip_previous,size: 30,color:Colors.white,), onPressed:(){}),
                  Container(decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white)),child: IconButton(icon:Icon(playButton,size:35,color:Colors.black,), onPressed:()async{
                    if(!playing){
                      final path= await getDirPath();
                      audioPlayer.play('${path}/${widget.fileName}',isLocal:true);
                      // audioCache.play('faded.mp3');
                      setState(() {
                        playButton=Icons.pause;
                        playing=true;
                      });
                    }
                    else{
                      audioPlayer.pause();
                      setState(() {
                        playButton=Icons.play_arrow;
                        playing=false;
                      });
                    }
                  })),
                  IconButton(icon:Icon(Icons.skip_next,size: 30,color:Colors.white,), onPressed:(){}),
                  Icon(Icons.sync_rounded,size: 25,color:Colors.white,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getDirPath() async{
    final externalDirectory= await getExternalStorageDirectory();
    final path=externalDirectory.path;
    return path;
  }
}
