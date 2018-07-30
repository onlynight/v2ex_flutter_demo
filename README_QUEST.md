写这个demo时的一些经验
=====================

# 1. 不显示widget唤醒后重新加载问题

## Flutter切换tab后保留tab状态

Flutter中为了节约内存不会保存widget的状态，widget都是临时变量。当我们使用TabBar，TabBarView是我们就会发现，切换tab后再重新切换回上一页面，这时候tab会重新加载重新创建，体验很不友好。Flutter出于自己的设计考虑并没有延续android的ViewPager这样的缓存页面设计，毕竟控件两端都要开发，目前还在beta版本有很多设计还不够完善，但是设计的拓展性没得说，flutter还是为我们提供了解决办法。我们可以强制widget不显示情况下保留状态，下回再加载时就不用重新创建了。

## AutomaticKeepAliveClientMixin

```AutomaticKeepAliveClientMixin``` 是一个抽象状态，使用也很简单，我们只需要用我们自己的状态继承这个抽象状态，并实现 ```wantKeepAlive``` 方法即可。

继承这个状态后，widget在不显示之后也不会被销毁仍然保存在内存中，所以慎重使用这个方法。

详细官方文档请看[这里][1]。
这里还有一个说的比较详细的 [demo][2]。

```dart
class PageContentState extends<PageContent> 
	with AutomaticKeepAliveClientMixin {

	@override
	bool get wantKeepAlive => true;

}
```

## DEMO

```dart
// main.dart
// 核心代码如下：

class PageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PageContentState();
}

class PageContentState extends State<PageContent>
    with AutomaticKeepAliveClientMixin
{

  @override
  bool get wantKeepAlive => true;

  ···
}

class V2EX extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            primaryColor: Colors.white),
        home: new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Center(
                child: new Container(
                  width: 300.0,
                  child: new TabBar(
                    indicatorColor: Colors.black54,
                    isScrollable: true,
                    tabs: choices.map((Choice choice) {
                      return new Container(
                        width: 125.0,
                        child: new Tab(
                          text: choice.title,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            body: new TabBarView(
              key: new Key('Home Page'),
              children: choices.map((Choice choice) {
                return new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new ChoiceCard(choice: choice),
                );
              }).toList(),
            ),
          ),
        ));
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '热门'),
  const Choice(title: '最新'),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.white,
      child: PageContent(),
    );
  }
}
```

[1]: https://docs.flutter.io/flutter/widgets/AutomaticKeepAliveClientMixin-class.html
[2]: https://hillelcoren.com/2018/06/12/flutter-complex-forms-with-multiple-tabs-and-relationships/amp/

# 2. 自定义形状image

```dart
new Container(
  width: 20.0,
  height: 20.0,
  decoration: new BoxDecoration(
    shape: BoxShape.circle,
    image: new DecorationImage(
      fit: BoxFit.fill,
      image: new NetworkImage(
          'https:' + topic.member.avatar_large),
    ),
  ),
)
```

```Container``` 的 ```decoration``` 属性可以定义装饰属性，就可以自定义图片形状了。
```shape``` ```BoxShape.circle```。

# 3. Json to Dart工具

https://github.com/debuggerx01/JSONFormat4Flutter

这是一个把json转换为dart bean的桌面工具，非常实用。

![action](https://github.com/debuggerx01/JSONFormat4Flutter/raw/master/Example/json.gif?raw=true)