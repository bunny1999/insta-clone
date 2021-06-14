import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta/fake_data.dart';
import 'package:insta/upload/helper/pick_image_helper.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  
  File image;
  
  @override
  void initState(){
    super.initState();
    //set null 
    setState(() {
      image=null;
    });
  }

  void updateDate(){
    //TODO:
    //image is file data manange
    feedsData.add({
    'name':'Pyare Mohan',
    'thumbNail':'https://images.pexels.com/photos/1427288/pexels-photo-1427288.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    "photo": "https://images.pexels.com/photos/1650281/pexels-photo-1650281.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "date":"OCTOBER 17",
    });
    //naivate to main screen
  }


  @override
  Widget build(BuildContext context) {
    print(image);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Add Photo'),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward,color: image!=null?Colors.blue:Colors.blue.shade100,), 
              onPressed: image!=null?()=>updateDate():null
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey.shade400,
                child: image!=null?Image.file(image,fit: BoxFit.cover):null,
              )
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      File _image =  await pickFromGallery();
                      setState(() {
                        image = _image;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      maxRadius: 40,
                      child: CircleAvatar(
                        maxRadius: 24,
                      ),
                    ),
                  )
                ),               
              )
            ),
          ],
        ),
      ),
    );
  }
}