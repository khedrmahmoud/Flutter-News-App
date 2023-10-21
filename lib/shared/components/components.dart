import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewsapp/medules/webview.dart';

Widget buildarticleItem(article,context)
{
  return InkWell(
    onTap: (){
      navigateTo(context, Webview(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child:Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text
              ('${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget devider()=>Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey,
  ),
);


void navigateTo(context,Widget widget)=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>widget)
);