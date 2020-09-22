import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';



class Takehome extends StatefulWidget {
  @override
  _TakehomeState createState() => _TakehomeState();
}

class _TakehomeState extends State<Takehome> {
  
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 160,
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: 
          <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageInkWell(
                        onPressed:() => Navigator.pushNamed(context, '/home'),
                        width: 150,
                        height: 80,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1547651196-4bd31258de69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                        
                      ),
                    ),
                    
                    SizedBox(
                      height: 0,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageInkWell(
                        onPressed:() => Navigator.pushNamed(context, '/AllRestaurant'),
                        width: 150,
                        height: 80,
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1547651196-4bd31258de69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                        
                      ),
                    ),
                    
                    SizedBox(
                      height: 0,
                    ),



         
         
        ],
      ),
    );
  }
}