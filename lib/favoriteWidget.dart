import 'package:Cookbook/favoriteChangeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteIconWidget extends StatefulWidget {
  //on cree le state et on lui passe les donnees a modifier
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget>{
   late bool _isFavorited ;

  _toggleFavorite(FavoriteChangeNotifier _notifier){
    setState(() {
      if(_isFavorited){
        _isFavorited = false;
      }else{
        _isFavorited = true;
      }

      _notifier.isFavorited = _isFavorited;

    });
  }

  @override
  Widget build(BuildContext context) {

    FavoriteChangeNotifier _notifier = Provider.of<FavoriteChangeNotifier>(context);
    _isFavorited = _notifier.isFavorited;

    return IconButton(
        onPressed: ()=> _toggleFavorite(_notifier),
        icon: _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined),
        color: Colors.red
    );
  }

}


class FavoriteTextWidget extends StatefulWidget {
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget>{
  @override
  Widget build(BuildContext context) {
    return  Consumer<FavoriteChangeNotifier>(builder: (context,notifier,_) => Text(notifier.favoriteCount.toString()) );
  }

}