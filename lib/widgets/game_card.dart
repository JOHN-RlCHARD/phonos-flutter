import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String difficulty;
  final String description;
  final AssetImage image;

  const GameCard({super.key, required this.title, required this.difficulty, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 360,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              image: DecorationImage(
                image: image,
                fit: BoxFit.fitWidth,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Text(
                  difficulty,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 22,),
              TextButton(
                onPressed: () {},
               child: Container(
                 alignment: Alignment.center,
                 width: 80,
                  decoration: BoxDecoration(
                  color: Color(0xFF449BC0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Jogar',
                     style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 15,)
          
        ],
      ),
    );
  }
}