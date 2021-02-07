import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: PersonWidget(),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> { // состояния задаются
                                                           // в классе, который
                                                           // наследуется от
                                                           // State
  bool _isFavorited = false; // они локальные т.к имеют значение только для
  int _favoriteCount = 87654; // одного виджета

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 40,
          child: Container(
            child: Text('$_favoriteCount '),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Япония, старшая Некома'),
      ),
      body: Container(
        child: _buildMainColumn(),
      ),
    );
  }

  Widget _buildMainColumn() => ListView(
    children: [
      _buildTopImage(),
      Center(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: _buildRating(),
              ),
              Card(
                elevation: 5, // тень карточки
                margin: const EdgeInsets.all(5),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: _buildAction(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: _buildDesc(),
              ),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _buildTopImage() => Container(
    child: Card(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      elevation: 5,
      child: Image.asset(
        'assets/images/leonardo_da_vinci.png',
        fit: BoxFit.cover,
      ),
    ),
  );

  Widget _buildRating() => ListTile(
    title: Text(
      'Куро Тецуро',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      ),
    ),
    subtitle: Text('Япония, Старшая Некома'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FavoriteWidget(),
      ],
    ),
  );

  Widget _buildAction() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildButton('Блокирующий', Icons.star, Colors.black),
      _buildButton('Рост 188 см.', Icons.radio_button_checked, Colors.black),
      _buildButton('Возраст 18 лет', Icons.school, Colors.black),
    ],
  );

  Widget _buildButton(String label, IconData icon, Color color) => Column(
    children: [
      Icon(icon, color: Colors.black,),
      Container(
        child: Text( 
          label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );

  Widget _buildDesc() => Text(
    'Куро Тецуро - третьекурсник старшей школы Некома.'
    ' Капитан мужского волейбольного клуба, играющий на позиции центрального',
    softWrap: true,
    style: TextStyle(
      fontSize: 18.0,
    ),
  );
}