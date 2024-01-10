import 'package:carousel_slider/carousel_slider.dart';
import 'package:cineflix/widgets/movies_slider.dart';
import 'package:cineflix/widgets/trending.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/api.dart';
import '../colours.dart';
import '../models/movies.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  // This widget is the root of your application.
   late Future<List<Movie>> trendingMovies;
   late Future<List<Movie>> topRatedMovies;

   late Future<List<Movie>> nowPlayingMovies;

   //
   @override
   void initState() {
     super.initState();
     trendingMovies = Api().getTrendingMovies();
     topRatedMovies = Api().getTopRatedMovies();
     nowPlayingMovies = Api().getnowPlayingMovies();
   }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.transparent,
          elevation:0,
           title: Image.asset(
             'lib/assets/images_2.jpg',
             fit: BoxFit.cover,
             height: 90  ,
             filterQuality: FilterQuality.high,
           ),
         centerTitle: true,
       ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text('Trending Movies',
              style: GoogleFonts.aBeeZee(fontSize:25 ),

            ),
            const SizedBox(
               height:16,
             ),
             SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return  Trending(snapshot: snapshot,);
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }


                },
              ),
            ),

            const SizedBox(
              height:32,
            ),
            Text('Top Rated Movies',
            style: GoogleFonts.aBeeZee(
              fontSize: 25,
            ),
            ),
            const SizedBox(
              height:32,
            ),
           // const MoviesSlider(),
            SizedBox(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return  MoviesSlider(snapshot: snapshot,);
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }


                },
              ),
            ),
            const SizedBox(
              height:32,
            ),
            Text('Upcoming Movies',
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height:32,
            ),
          // const MoviesSlider(),
            SizedBox(
              child: FutureBuilder(
                future: nowPlayingMovies,
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return  MoviesSlider(snapshot: snapshot,);
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }


                },
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}


