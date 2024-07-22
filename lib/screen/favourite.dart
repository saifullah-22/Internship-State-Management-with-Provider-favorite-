import 'package:flutter/material.dart';
import 'package:flutter_vs_provider_correct_favourite_app/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavoutitePage extends StatelessWidget {
  const FavoutitePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final words = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: ((context, index) {
          final word= words[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
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
            provider.clearFavourite();
          },
          label: const Text("Clear All"),
          
          ),

    );
  }
}