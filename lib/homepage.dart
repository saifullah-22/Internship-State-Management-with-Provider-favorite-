import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_vs_provider_correct_favourite_app/provider/favourite_provider.dart';
import 'package:flutter_vs_provider_correct_favourite_app/screen/favourite.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();    
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Statemanagement"),
        actions: [
          IconButton(
            onPressed: (){
              final route = MaterialPageRoute(
              builder: (context) => const FavoutitePage()
              );
            Navigator.push(context, route);
          },
             
            icon: const Icon(Icons.favorite))
        ],
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: ((context, index) {
          final word= words[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
             // width: 170,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
              child: ListTile(
                title: Text(word),
                trailing: IconButton(
                  onPressed: (){
                    provider.toggleFavourite(word);
            
                  }, 
                  icon: provider.isExist(word)
                  ? const Icon(Icons.favorite,
                  color: Colors.red,)
                  : const Icon(Icons.favorite_border)
                  ),
              ),
            ),
          );


        }
        )
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            final route = MaterialPageRoute(
              builder: (context) => const FavoutitePage()
              );
            Navigator.push(context, route);
          },
          label: const Text("Favourites"),
          
          ),
    );
  }
}