import 'package:flutter/material.dart';
class EmployeeDetails extends StatefulWidget {
  String firstName,lastName,email,avatar;
  EmployeeDetails({this.firstName,this.lastName,this.email,this.avatar});

  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> with SingleTickerProviderStateMixin {
  bool isFav=false;
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  @override
  void initState() {
    _controller=AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this
    );
    _colorAnimation=ColorTween(begin: Colors.grey[400],end: Colors.red).animate(_controller);
    _sizeAnimation=TweenSequence(<TweenSequenceItem<double>> [
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30,end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50,end: 30),
        weight: 50,
      )
    ]).animate(_controller);
    _controller.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        setState(() {
          isFav=true;
        });
      }
      if(status==AnimationStatus.dismissed){
        setState(() {
          isFav=false;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Employee Details'),
        backgroundColor: Colors.amber,
      ),
      body:Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(width: double.infinity,child: Hero(tag: 'image-${widget.firstName}',child: Image.network(widget.avatar,height:300,alignment:Alignment.topCenter,fit:BoxFit.cover,))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,20,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedBuilder(
                          animation: _controller,
                          builder: (context, _) {
                            return Container(
                              decoration:BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: Colors.white,width: 2)
                              ),
                              child: IconButton(iconSize:_sizeAnimation.value,color: _colorAnimation.value,icon:Icon(Icons.favorite), onPressed:(){
                                isFav?_controller.reverse():_controller.forward();
                              }),
                            );
                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height:20),

            SizedBox(height:20),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0,0,10,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${widget.firstName} ${widget.lastName}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0,0,10,0),
              child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Email - ${widget.email}',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),),
                    ],
                  )
            ),
          ],
        ),
      ),
    );
  }
}
