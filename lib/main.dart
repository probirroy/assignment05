import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 05',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabbedScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabbedScreen extends StatefulWidget {
  @override
  _TabbedScreenState createState() => _TabbedScreenState();
}

class _TabbedScreenState extends State<TabbedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Assignment 05'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
           child: Center(
              child: Text(
                'Assignment 05',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Page 1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                    color: Colors.black),),
              onTap: () {
                _onPageChanged(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                    color: Colors.black),),
              onTap: () {
                _onPageChanged(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Page 3',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                    color: Colors.black),),
              onTap: () {
                _onPageChanged(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PageWidget(1, Colors.red),
          PageWidget(2, Colors.green),
          PageWidget(3, Colors.blue),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          _onPageChanged(index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final int pageNumber;
  final Color floatingActionButtonColor;

  PageWidget(this.pageNumber, this.floatingActionButtonColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: floatingActionButtonColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Page $pageNumber',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
