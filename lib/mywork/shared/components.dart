import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget builditem(screen)
{
  return Padding(
    padding: EdgeInsets.all(20),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 120,width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:DecorationImage(
                  image: NetworkImage('${screen['urlToImage']}',),
                 fit: BoxFit.cover,),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${screen['title']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('${screen['publishedAt']}',
                      style: TextStyle(
                          color: Colors.indigo
                      )
                  ),
                ],
              ),
            ))

          ],
        ),
      )
  );
}

Widget devider()
{
  return Container(
    height: 1,
    width: double.infinity,
    color: Colors.black45,
  );
}