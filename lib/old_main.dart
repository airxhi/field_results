import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true; // Set to true for visual layout
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final showGrid = false; // Set to false to show ListView

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter yeeting demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter yeeting demo'),
        ),
        body: Center(child: showGrid ? _buildGrid() : _buildList()),
      ),
    );
  }

  // #docregion grid
  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(30));

  // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
  // The List.generate() constructor allows an easy way to create
  // a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) => List.generate(
      count, (i) => Container(child: Image.asset('images/pic0.jpg')));
  // #enddocregion grid

  // #docregion list
  Widget _buildList() => ListView(
        children: [
          _tile('Alastair White', '1.25m', Icons.directions_run),
          _tile('Ruth Turpie', '1.3m', Icons.directions_run),
          _tile('Sharan Maiya', '1.2m', Icons.directions_run),
          _tile('Michael Cairney', '1.45m', Icons.directions_run),
          _tile('United Artists Stonestown Twin', '501 Buckingham Way',
              Icons.directions_run),
          _tile('AMC Metreon 16', '135 4th St #3000', Icons.directions_run),
          Divider(),
          _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.directions_run),
          _tile('Emmy\'s directions_run', '1923 Ocean Ave', Icons.directions_run),
          _tile(
              'Chaiya Thai directions_run', '272 Claremont Blvd', Icons.directions_run),
          _tile('La Ciccia', '291 30th St', Icons.directions_run),
        ],
      );

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
  // #enddocregion list
}