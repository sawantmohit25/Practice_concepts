import 'package:flutter/material.dart';
import 'package:sembast_app/responsive.dart';

class ResponsiveDemo extends StatelessWidget {
  TextEditingController name =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController carNumber =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: OrientationBuilder(builder:(context,orientation){
        print('mandar');
        if(orientation==Orientation.portrait){
          Size screenSize=MediaQuery.of(context).size;
          var height =screenSize.height - MediaQuery.of(context).padding.top-kToolbarHeight;
          var width =screenSize.width;
          return portrait(height,width);
        }
        else{
          Size screenSize=MediaQuery.of(context).size;
          var h =screenSize.height - MediaQuery.of(context).padding.top-kToolbarHeight;
          var w =screenSize.width;
          print('lanheight${h}');
          print('lanwidth${w}');
          return landscape(w,h);
        }
      }),
      tablet: OrientationBuilder(builder:(context,orientation){
        print('mohit');
        if(orientation==Orientation.portrait){
          Size screenSize=MediaQuery.of(context).size;
          var height =screenSize.height - MediaQuery.of(context).padding.top-kToolbarHeight;
          var width =screenSize.width;
          return portrait(height,width);
        }
        else{
          Size screenSize=MediaQuery.of(context).size;
          var h =screenSize.height - MediaQuery.of(context).padding.top-kToolbarHeight;
          var w =screenSize.width;
          print('lanheight${h}');
          print('lanwidth${w}');
          return landscape(w,h);
        }
      }),
    );
  }

  Widget portrait(double height, double width) {
    print('saurabh');
    return Scaffold(
        appBar:AppBar(
          title: Text('Responsive Survey Form'),
          centerTitle: true,
        ),
        body:SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0,20.0,10.0,0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Name',style: TextStyle(fontSize:height*0.02),),//15
                      ],
                    ),
                    SizedBox(height:height*0.01),
                    TextField(style:TextStyle(fontSize:height*0.02),controller:name,decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                      hintText:'Enter Your Name',
                      hintStyle:TextStyle(color:Colors.blue),
                    ),),
                    SizedBox(height:height*0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Email ID',style: TextStyle(fontSize:height*0.02),),
                      ],
                    ),
                    SizedBox(height:height*0.01),
                    TextField(style:TextStyle(fontSize:height*0.02),controller:email,decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                      hintText:'Enter Your Email Id',
                      hintStyle:TextStyle(color:Colors.blue),
                    ),),
                    SizedBox(height:height*0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Available Cars:-',style: TextStyle(fontSize:height*0.02),),
                      ],
                    ),
                    SizedBox(height:height*0.02),
                    ListView(
                      shrinkWrap: true,
                      physics:BouncingScrollPhysics(),
                      children: [
                        Center(
                          child: Container(
                            height:height*0.26,
                            child: Stack(
                              children: [
                                Image.network('https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                Text('1',style: TextStyle(color: Colors.red,fontSize:height*0.04),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height:height*0.01),
                        Center(
                          child: Container(
                            height:height*0.26,
                            child: Stack(
                              children: [
                                Image.network('https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                Text('2',style: TextStyle(color: Colors.red,fontSize:height*0.04),),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height:height*0.01),
                        Center(
                          child: Container(
                            height: height*0.26,
                            child: Stack(
                              children: [
                                Image.network('https://images.unsplash.com/photo-1597007066704-67bf2068d5b2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNhcnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                Text('3',style: TextStyle(color: Colors.red,fontSize:height*0.04),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height:height*0.01),
                        Center(
                          child: Container(
                            height:height*0.26,
                            child: Stack(
                              children: [
                                Image.network('https://images.unsplash.com/photo-1514867644123-6385d58d3cd4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGNhcnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                Text('4',style: TextStyle(color: Colors.red,fontSize:height*0.04),),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height:height*0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Car No',style: TextStyle(fontSize:height*0.02),),
                      ],
                    ),
                    SizedBox(height:height*0.01),
                    TextField(style:TextStyle(fontSize:height*0.02),controller:carNumber,decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                      hintText:'Enter the Car Number',
                      hintStyle:TextStyle(color:Colors.blue),
                    ),),
                    SizedBox(height:height*0.01),
                    Container(
                      width:double.infinity,
                      height:height*0.04,
                      child: RaisedButton(color:Colors.blue,onPressed:(){

                      },
                        child: Text('Submit',style: TextStyle(color: Colors.white,fontSize:height*0.02),),),
                    ),
                    SizedBox(height: height*0.02,)
                  ],
                ),
              ),
            ),
          ),
        )
    );

  }

  Widget landscape(double height, double width) {
    print('pintu');
    return SafeArea(
      minimum: EdgeInsets.only(left:30.0),
      child: Scaffold(
          appBar:AppBar(
            title: Text('Responsive Survey Form'),
            centerTitle: true,
          ),
          body:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0,20.0,10.0,0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Name',style: TextStyle(fontSize:height*0.02),),
                    ],
                  ),
                  SizedBox(height:height*0.01),
                  TextField(style:TextStyle(fontSize:height*0.02),controller:name,decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                    hintText:'Enter Your Name',
                    hintStyle:TextStyle(color:Colors.blue),
                  ),),
                  SizedBox(height:height*0.01),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      Text('Email ID',style: TextStyle(fontSize:height*0.02),),
                    ],
                  ),
                  SizedBox(height:height*0.01),
                  TextField(style:TextStyle(fontSize:height*0.02),controller:email,decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                    hintText:'Enter Your Email Id',
                    hintStyle:TextStyle(color:Colors.blue),
                  ),),
                  SizedBox(height:height*0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Cars Available:-',style: TextStyle(fontSize:height*0.02),),
                    ],
                  ),
                  SizedBox(height:height*0.02),
                  Container(
                    height:height*0.26,
                    child: ListView(
                        shrinkWrap: true,
                        physics:BouncingScrollPhysics(),
                        scrollDirection:Axis.horizontal,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Image.network('https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                Text('1',style: TextStyle(color: Colors.red,fontSize:height*0.04),),
                              ],
                            ),
                          ),
                          SizedBox(width:width*0.01),
                          Center(
                            child: Stack(
                              children: [
                                Image.network('https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                Text('2',style: TextStyle(color: Colors.red,fontSize:height*0.04),),

                              ],
                            ),
                          ),
                          SizedBox(width:width*0.01),
                          Center(
                            child: Stack(
                              children: [
                                Image.network('https://images.unsplash.com/photo-1597007066704-67bf2068d5b2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNhcnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                Text('3',style: TextStyle(color: Colors.red,fontSize:height*0.04),),
                              ],
                            ),
                          ),
                          SizedBox(width:width*0.01),
                          Center(
                            child: Stack(
                              children: [
                                Image.network('https://images.unsplash.com/photo-1514867644123-6385d58d3cd4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fGNhcnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                                Text('4',style: TextStyle(color: Colors.red,fontSize:height*0.04),),

                              ],
                            ),
                          )
                        ],
                      ),
                  ),
                  SizedBox(height:height*0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Car No',style: TextStyle(fontSize:height*0.02),),
                    ],
                  ),
                  SizedBox(height:height*0.01),
                  TextField(style:TextStyle(fontSize:height*0.02),controller:carNumber,decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                    hintText:'Enter the Car Number',
                    hintStyle:TextStyle(color:Colors.blue),
                  ),),
                  SizedBox(height:height*0.01),
                  Container(
                    width:double.infinity,
                    height:height*0.04,
                    child: RaisedButton(color:Colors.blue,onPressed:(){

                    },
                      child: Text('Submit',style: TextStyle(color: Colors.white,fontSize:height*0.02),),),
                  ),
                  SizedBox(height: height*0.02,)
                ],
              ),
            ),
          )
      ),
    );
  }
}
