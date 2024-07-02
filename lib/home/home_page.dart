import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            print('Back pressed');
          },
        ),
        title: Image.asset(
          "image/bee.png",
          width: 40,
          height: 40,
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              print('Options pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Entrez votre destination...',
                        hintText: 'Entrez votre destination...',
                        filled: true,
                        fillColor: const Color.fromARGB(35, 94, 94, 94),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer une destination';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print('Search pressed');
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    AccommodationCard(
                      imageUrl: 'image/villa.png',
                      title: 'Charmante villa',
                      location: 'Monaco, France',
                      distance: '2 km',
                      pricePerNight: 120,
                      numberOfReviews: 34,
                    ),
                    AccommodationCard(
                      imageUrl: 'image/appartement.png',
                      title: 'Appartement moderne',
                      location: 'Lyon, France',
                      distance: '500 m',
                      pricePerNight: 90,
                      numberOfReviews: 21,
                    ),

                    AccommodationCard(
                      imageUrl: 'image/caravane.png',
                      title: 'Caravane',
                      location: 'Melun, France',
                      distance: '5 m',
                      pricePerNight: 9,
                      numberOfReviews: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccommodationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String distance;
  final int pricePerNight;
  final int numberOfReviews;

  const AccommodationCard({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.distance,
    required this.pricePerNight,
    required this.numberOfReviews,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.white,
                  onPressed: () {
                    print('Like pressed');
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.grey),
                    SizedBox(width: 5.0),
                    Text(
                      location,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10.0),
                    Icon(Icons.directions_walk, color: Colors.grey),
                    SizedBox(width: 5.0),
                    Text(
                      distance,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  '\$$pricePerNight par nuit',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  '$numberOfReviews avis',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
