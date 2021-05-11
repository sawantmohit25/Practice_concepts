import 'package:flutter/material.dart';
import 'package:sembast_app/flutter_widgets/widgets_first.dart';
import 'package:sembast_app/flutter_widgets/widgets_third.dart';
class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin{
  bool selected=false,visible=false;
  AnimationController _animationController1,_animationController2;
  bool isPlaying1 = false,isPlaying2 =false;
  @override
  void initState() {
    _animationController1=AnimationController(
      duration:Duration(seconds: 1),
      vsync: this,
    );
    _animationController2=AnimationController(
      duration:Duration(seconds: 1),
      vsync: this,
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>WidgetsFirst()));
        },
        child:Icon(Icons.navigate_next),
      ),
      appBar:AppBar(
        title: Text('Flutter Widgets'),
        actions: [
          IconButton(icon:Icon(Icons.navigate_next), onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>WidgetsThird()));
          })
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text('Wrap Widget Implememtation'),
                  ],
                ),
                Wrap(
                  children: [
                    Image.network('https://images.unsplash.com/photo-1615801626607-0bfd985f5ae9?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8NnNNVmpUTFNrZVF8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',height:120,width: 120,),
                    SizedBox(width:10),
                    Image.network('https://images.unsplash.com/uploads/141327328038701afeede/eda0fb7c?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI4fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',height:120,width: 120,),
                    SizedBox(width:10),
                    Image.network('https://images.unsplash.com/photo-1467625575448-2ef10dabab8a?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQzfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',height:120,width: 120,),
                    SizedBox(width:10),
                    Image.network('https://images.unsplash.com/photo-1619891928588-c6ede4825fab?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDY1fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',height:120,width: 120,),
                    SizedBox(width:10),
                  ],
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text('Animated Container Widget Implementation'),
                  ],
                ),
                SizedBox(height:20),
                InkWell(
                  onTap:(){
                    setState(() {
                      selected=!selected;
                    });
                  },
                  child: AnimatedContainer(duration:Duration(seconds: 1),
                    width: selected ? 200.0 : 100.0,
                    height: selected ? 100.0 : 200.0,
                    color: selected ? Colors.yellow : Colors.red,
                    alignment: selected ? Alignment.center : AlignmentDirectional.center,
                    curve: Curves.fastOutSlowIn,
                    child:FlutterLogo(size:50,),
                  ),
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text('Animated Opacity Widget Implementation'),
                  ],
                ),
                SizedBox(height:20),
                InkWell(onTap: (){
                  setState(() {
                    visible=!visible;
                  });
                },child: AnimatedOpacity(curve:Curves.easeInOut,duration:Duration(seconds: 1),opacity:visible?0.0:1.0,child: Image.network('https://images.unsplash.com/photo-1619891928588-c6ede4825fab?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDY1fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',height:150,width: 150,))),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text('Animated Icon Widget Implementation'),
                  ],
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(iconSize: 50,icon:AnimatedIcon(
                      icon:AnimatedIcons.home_menu,
                      progress: _animationController1,
                    ), onPressed:handleIcon1),
                    IconButton(iconSize: 50,icon:AnimatedIcon(
                      icon:AnimatedIcons.pause_play,
                      progress: _animationController2,
                    ), onPressed:handleIcon2),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleIcon1() {
    setState(() {
      isPlaying1=!isPlaying1;
      isPlaying1?_animationController1.forward():_animationController1.reverse();
    });
  }

  void handleIcon2() {
    setState(() {
      isPlaying2=!isPlaying2;
      isPlaying2?_animationController2.forward():_animationController2.reverse();
    });
  }
}
