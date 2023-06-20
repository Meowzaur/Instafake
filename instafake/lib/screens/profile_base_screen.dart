import 'package:flutter/material.dart';

import '../widgets/profile_header_widget.dart';
import 'gallery_screen.dart';
import 'igtv_screen.dart';
import 'reels_screen.dart';

class ProfileBaseScreen extends StatefulWidget {
  @override
  State<ProfileBaseScreen> createState() => _ProfileBaseScreenState();
}

class _ProfileBaseScreenState extends State<ProfileBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "jeffrey_gerson",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                  delegate: SliverChildListDelegate([
                profileHeaderWidget(context),
              ])),
            ];
          },
          body: Column(
            children: [
              Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  Gallery(),
                  Igtv(),
                  Reels(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
