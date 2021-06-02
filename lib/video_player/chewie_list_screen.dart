import 'package:flutter/material.dart';
import 'package:sembast_app/video_player/chewie_video_player.dart';
import 'package:video_player/video_player.dart';
class ChewieListScreen extends StatelessWidget {
  // List videoList=[
  //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  //   'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/yt_logo.png',
          fit: BoxFit.cover,
          width: 100.0,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.videocam,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.account_circle,
            ),
          ),
        ],
      ),
      bottomNavigationBar:BottomAppBar(
        color: Colors.black,
        child: Container(
          color: Colors.black,
          height: 50.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.whatshot,
                    color: Colors.white,
                  ),
                  Text(
                    "Trending",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:20),
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.subscriptions,
                    color: Colors.white,
                  ),
                  Text(
                    "Subscriptions",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.folder,
                    color: Colors.white,
                  ),
                  Text(
                    "Library",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body:ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10.0,
                child: Container(
                  color: Colors.black,
                ),),
              ChewieListItem(videoPlayerController:VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')),
              ListTile(
              leading: CircleAvatar(
                child:Text('A',style:TextStyle(color:Colors.white),),
                backgroundColor:Colors.amber,
              ),
              title: Text(
              "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself.",
              textAlign: TextAlign.start,
              ),
              subtitle: Text(
              "Big Buck Bunny - 200 Views - 1 Hour",
              ),
              trailing: Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
            child: Container(
              color: Colors.black,
            ),),
          ChewieListItem(videoPlayerController:VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4')),
          ListTile(
            leading: CircleAvatar(
              child:Text('B',style:TextStyle(color:Colors.white),),
              backgroundColor:Colors.red,
            ),
            title: Text(
              "The first Blender Open Movie from 2006",
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              "Elephant Dream - 800 Views - 6 Hour",
            ),
            trailing: Icon(Icons.more_vert, color: Colors.white),
          ),
          SizedBox(
            height: 10.0,
            child: Container(
              color: Colors.black,
            ),),
          ChewieListItem(videoPlayerController:VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4')),
          ListTile(
            leading: CircleAvatar(
              child:Text('C',style:TextStyle(color:Colors.white),),
              backgroundColor:Colors.blue,
            ),
            title: Text(
              "HBO GO now works with Chromecast -- the easiest way to enjoy online video ",
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              "For Bigger Blazes - 15000 Views - 1 Day",
            ),
            trailing: Icon(Icons.more_vert, color: Colors.white),
          ),
          SizedBox(
            height: 10.0,
            child: Container(
              color: Colors.black,
            ),),
          ChewieListItem(videoPlayerController:VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4')),
          ListTile(
            leading: CircleAvatar(
              child:Text('D',style:TextStyle(color:Colors.white),),
              backgroundColor:Colors.green,
            ),
            title: Text(
              "Introducing Chromecast. The easiest way to enjoy online video and music",
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              "For Bigger Escape - 2M Views - 1 Month",
            ),
            trailing: Icon(Icons.more_vert, color: Colors.white),
          ),
          SizedBox(
            height: 10.0,
            child: Container(
              color: Colors.black,
            ),),
        ],
      ),
      // body:ListView.builder(
      //   itemCount:videoList.length,
      //   itemBuilder:(context,index){
      //     return ChewieListItem(videoPlayerController:VideoPlayerController.network(videoList[index]));
      //   },
      // ),
    );
  }
}
