import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled1/path.dart';
import 'pixel.dart';
import 'path.dart';
import 'player.dart';
import 'pacghost.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
static  int numberInRow =11;
  int numberOfSquares = numberInRow * 17;
  int player = numberInRow * 11 + 1;
  List<int> barriers =[
  24,114,125,116,127,35,46,57,26,37,38,39,28,30,41,52,63,70,59,61,72,30,41,52,63,78,79,80,81,83,84,85,86,100,101,102,103,105,106,107,108,123,134,156,158,147,148,149,160,129,140,162,0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,66,77,88,99,110,121,132,143,153,154,155,156,157,158,159,160,161,162,163,164,142,131,120,109,98,87,76,65,54,43,32,21
  ];
  List<int> food =[];

  String direction ="right";
  bool preGame = true;
  bool mouthClosed = false;
  int score = 0;


  void startGame(){
    movePacghost();
    preGame = false;
    getFood();
   Timer.periodic(Duration(milliseconds: 120), (timer) {
     setState(() {
       mouthClosed = !mouthClosed;
     });

     if(food.contains(player)) {
       food.remove(player);
       score++;
     }
     if (player==pacghost) {
       pacghost = -1;
     }

     switch(direction){
       case "left":
         moveLeft();
       break;

       case "right":
         moveRight();
         break;

       case " up":
         moveUp();
         break;

         case"down":
           moveDown();
           break;
     }

   });

   }

   int pacghost = numberInRow*2-2;
  String pacghostDirection = "left";
  void movePacghost(){}


   void getFood() {
    for(int i=0; i<numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
   }

   void moveLeft() {
    if(!barriers.contains(player-1)) {
     setState(() {
       player++;
     });
   }}
   void moveRight() {
     if(!barriers.contains(player+1)) {
       setState(() {
         player++;
       });
     }

   }
   void moveUp() {
    if(!barriers.contains(player- numberInRow)) {
     setState(() {
       player -=numberInRow;
     });
   }
  }
   void moveDown() {
    if(!barriers.contains(player+numberInRow)) {
     setState(() {
       player +=numberInRow;
     });
   }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex:5,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = "down";
                } else if (details.delta.dy < 0) {
                 direction ='up';
                }
                 },
              onHorizontalDragUpdate: (details){if (details.delta.dx > 0) {
                direction = "right";
              } else if (details.delta.dx < 0) {
                direction ='left';
              }

              },
              child: Container(
                  child:GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: numberOfSquares,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: numberInRow),
                     build(BuildContext context, int index) {

                      if(mouthClosed){
                       return Padding(padding: EdgeInsets.all(4),
                           child:Container(
                             decoration: BoxDecoration(
                               color:Colors.yellow,
                               shape: BoxShape.circle
                             ),
                            ),
                           );
                     }


                      else if(player==index) {

                          switch(direction){
                            case  "left":
                            return  Transform.rotate(angle: pi, child:MyPlayer(),);
                              break;

                            case  "right":
                             return MyPlayer();
                             break;

                              case  "up":
                               return Transform.rotate(angle: pi/2, child:MyPlayer(),);
                            break;
                            case  "down":
                            return  Transform.rotate(angle: 3*pi/2, child:MyPlayer(),);
                              break;
                            default: MyPlayer();

                          }

                        }
                       else if(barriers.contains(index)) {
                        return MyPixel(

                            innerColor: Colors.blue[800],
                              outerColor: Colors.blue[900],
                             // child: Text (index.toString())

                          );
                      } else {
                        return MyPath(

                            innerColor: Colors.green,
                              outerColor: Colors.black,
                            //  child: Text(index.toString())
                          );

                      }

                      }),
                      ),
            ),
                    ),

          Expanded(
            child: Container(
              child :Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Score: " + score.toString(),
                  style: TextStyle(color: Colors.white,fontSize:40),),
                  GestureDetector(

                     onTap:startGame,
                      child: Text("P L A Y",style: TextStyle(color: Colors.white,fontSize:40),)),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
