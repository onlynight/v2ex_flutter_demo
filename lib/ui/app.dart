import 'package:flutter/material.dart';
import 'package:flutter_app/network/NetworkApi.dart';
import 'package:flutter_app/ui/home/Home.dart';

class V2EXApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _V2EXAppState();
}

class _V2EXAppState extends State<V2EXApp> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'V2EX Flutter App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: new Center(
            child: new Text('V2EX'),
          ),
          bottom: TabBar(
              controller: _controller,
              isScrollable: false,
              indicatorColor: Colors.black54,
              tabs: const <Widget>[
                const Tab(
                  text: '热门',
                ),
                const Tab(
                  text: '最新',
                ),
              ]),
        ),
        body: new TabBarView(controller: _controller, children: <Widget>[
          new HotHomePageView(),
          new LatestHomePageView(),
        ]),
      ),
    );
  }
}
