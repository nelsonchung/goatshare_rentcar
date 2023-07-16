import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            255, 249, 202, 6), // Set the background color to yellow
        //title: const Text('Please'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(
              80.0), // Increase the height to fit the new content
          child: Column(
            children: <Widget>[
              Text('Pick Up'),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Brands',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                  'assets/bmw.png'), // Replace with your image asset paths
              Image.asset('assets/benz.png'),
              Image.asset('assets/porsche.png'),
              Image.asset('assets/all.png'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Most liked',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const ListTile(
            //leading: Image.asset(
            //    'assets/brand1.png'), // Replace with your image asset path
            title: Text('Brand 1'),
          ),
          const ListTile(
            //leading: Image.asset(
            //    'assets/brand2.png'), // Replace with your image asset path
            title: Text('Brand 2'),
          ),
          // Add more brands here
        ],
      ),
    );
  }
}
