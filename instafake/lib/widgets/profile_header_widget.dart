import 'package:flutter/material.dart';

import '../data/data.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff74EDED),
                backgroundImage: NetworkImage(
                    "https://static.wikia.nocookie.net/rolbenigno/images/9/91/Eustaquio_Habichuela.jpg/revision/latest?cb=20190505102519&path-prefix=es"),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "334",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "posts",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.4,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        "211K",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "followers",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.4,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        "134",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "following",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.4,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),

              // AQUIIIIIIIIIIIIIIIIIIIII
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Jeffrey Gerson",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 0.4),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Discovering stories around the world.",
            style: TextStyle(letterSpacing: 0.4),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "blog.jeffreygerson.com",
            style: TextStyle(color: Colors.blue, letterSpacing: 0.4),
          ),
          SizedBox(
            height: 20,
          ),

          // CAMBIAR BOTÓN DE SITIO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size(0, 30),
                  side: BorderSide(color: Colors.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Message",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 85,
            child: ListView.builder(
                itemCount: highlightItems.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(highlightItems[index].thumbnail),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              highlightItems[index].title,
                              style: TextStyle(fontSize: 13),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    ),
  );
}
