import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:markets/generated/l10n.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Support'),
        elevation: 0,
      ),

      body:Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
             S.of(context).frequently,
            style: Theme.of(context).textTheme.headline3,
            ),
          ),
   
      SizedBox(height:20,),


          ListTile(
          onTap: (){
           // Navigator.of(context).pushNamed('');
          },
     trailing: Icon(Icons.arrow_forward_ios),
     title: Text(
           S.of(context).myorderdelivered,
           style: Theme.of(context).textTheme.caption,
     ),
    ),
    divider(),
       
      ListTile(
        onTap: (){
          // Navigator.of(context).pushNamed('');
        },
       trailing: Icon(Icons.arrow_forward_ios), 
       title: Text(
         S.of(context).myordercame,
        style: Theme.of(context).textTheme.caption,
       ),
      ),
      divider(),

       ListTile(
        onTap: (){
          // Navigator.of(context).pushNamed('');
        },
       trailing: Icon(Icons.arrow_forward_ios), 
       title: Text(
         S.of(context).changmyphone,
        style: Theme.of(context).textTheme.caption,
       ),
      ), 
      divider(),

       ListTile(
        onTap: (){
          // Navigator.of(context).pushNamed('');
        },
       trailing: Icon(Icons.arrow_forward_ios), 
       title: Text(
         S.of(context).changmydelivery,
        style: Theme.of(context).textTheme.caption,
       ),
      ), 
      divider(),

      
       Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
             S.of(context).paymentmethods,
            style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(height:20,),
         
          


       ListTile(
        onTap: (){
          // Navigator.of(context).pushNamed('');
        },
       trailing: Icon(Icons.arrow_forward_ios), 
       title: Text(
         S.of(context).howdoichange,
        style: Theme.of(context).textTheme.caption,
       ),
      ), 
      divider(),

       ListTile(
        onTap: (){
          // Navigator.of(context).pushNamed('');
        },
       trailing: Icon(Icons.arrow_forward_ios), 
       title: Text(
         S.of(context).canirefund,
        style: Theme.of(context).textTheme.caption,
       ),
      ), 
      divider(), 

       

       
       
       
       
        ],
      ),
       
       
       









    );

  
     
  

  }

  Widget divider() {
    return Divider(
      indent: 20,
      endIndent: 20,
      height: 25,
      color: Colors.black26,
    );
  }

}