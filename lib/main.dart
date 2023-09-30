import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: isLandscape
            ? _buildLandscapeLayout()
            : _buildPortraitLayout(),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: <Widget>[
        SizedBox(height: 8.0),
        Center(
          child: CircleAvatar(
            radius: 160,
            backgroundImage: NetworkImage(
                'https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg'),
          ),
        ),
        SizedBox(height: 16.0),
        Center(
          child: Text(
            'John Doe',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'It is my flutter project for profile apppppp',
          style: TextStyle(
            fontSize: 20,
          ),
        ),

        SizedBox(height: 16.0),
        _buildPhotoGrid(3),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: CircleAvatar(
              radius: 160,
              backgroundImage: NetworkImage(
                  'https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg'),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'John doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Module 8 assignment on profile app.ostad batch 4.This is the solution of the assignment',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16.0),
              _buildPhotoGrid(3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoGrid(int crossAxisCount) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      children: List.generate(9, (index) {
        final imageUrl =
            'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/bltcad7bd066b858c46/633ef9dca846b03282ff2b95/Social-16-9_(2).jpg?auto=webp&format=pjpg&width=3840&quality=60';
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Image.network(imageUrl, fit: BoxFit.cover),
        );
      }),
    );
  }
}