import 'package:flutter/material.dart';
import 'package:untitled1/path.dart';
import 'pixel.dart';
import 'path.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
static  int numberInRow =11;
  int numberOfSquares = numberInRow * 17;
  List<int> barriers =[
  24,114,125,116,127,35,46,57,26,37,38,39,28,30,41,52,63,70,59,61,72,30,41,52,63,78,79,80,81,83,84,85,86,100,101,102,103,105,106,107,108,123,134,156,158,147,148,149,160,129,140,162,0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,66,77,88,99,110,121,132,143,153,154,155,156,157,158,159,160,161,162,163,164,142,131,120,109,98,87,76,65,54,43,32,21
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex:5,
            child: Container(
                child:GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    itemCount: numberOfSquares,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: numberInRow),
                    itemBuilder: (BuildContext context, int index){
                    if(barriers.contains(index)) {
                      return MyPixel(

                          innerColor: Colors.blue[800],
                            outerColor: Colors.blue[900],
                           // child: Text (index.toString())

                        );
                    } else {
                      return MyPath(

                          innerColor: Colors.yellow,
                            outerColor: Colors.black,
                          //  child: Text(index.toString())
                        );

                    }

                    }),
                    ),
                    ),

          Expanded(
            child: Container(
              child :Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Score: ",style: TextStyle(color: Colors.white,fontSize:40),),
                  Text("P L A Y",style: TextStyle(color: Colors.white,fontSize:40),),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
