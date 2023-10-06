import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> SizeofDress=['M','L','Xl','L','XXL'];
  List<String> ColorofDress=['Red','Gray','Orange','Orange','Orange'];
  List<String> Dress=['Pullover','T-Shirt','Sport Dress','Shirt','Pant'];
  List<int> Counts = [0, 0, 0, 0, 0];
  List<int> price = [10, 20, 30, 40,50];
  List<String> url = [
    'https://img.freepik.com/free-photo/glad-promoter-has-beaming-smile-points-with-thumb-empty-space-dressed-red-elegant-clothes_273609-24486.jpg?size=626&ext=jpg&ga=GA1.1.1718477284.1694635515&semt=ais',
    'https://s1.1zoom.me/big0/597/Footbal_Fingers_Gray_background_Ball_Boys_548634_1280x853.jpg',
    'https://img.freepik.com/free-photo/surprised-happy-girl-pointing-left-recommend-product-advertisement-make-okay-gesture_176420-20191.jpg?size=626&ext=jpg&ga=GA1.1.1718477284.1694635515&semt=ais',
    'https://img.freepik.com/free-photo/surprised-happy-girl-pointing-left-recommend-product-advertisement-make-okay-gesture_176420-20191.jpg?size=626&ext=jpg&ga=GA1.1.1718477284.1694635515&semt=ais',
    'https://img.freepik.com/free-photo/surprised-happy-girl-pointing-left-recommend-product-advertisement-make-okay-gesture_176420-20191.jpg?size=626&ext=jpg&ga=GA1.1.1718477284.1694635515&semt=ais',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.search_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3.9,bottom: 10),
                child: Align(
                    alignment: AlignmentDirectional.topStart,
          child: const Text("My Bag",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),)),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: Row(
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 2,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    "${url[index]}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                flex: 5,
                                child: ListTile(
                                  trailing: Column(
                                    children: [
                                      Icon(Icons.more_vert),
                                      Padding(
                                        padding: EdgeInsets.only(top: 14),
                                        child: Text("${price[index]}\$"),
                                      ),
                                    ],
                                  ),
                                  title: Text("${Dress[index]}",style: TextStyle(fontWeight: FontWeight.bold),),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text("Color :"),
                                                Text("${ColorofDress[index]}",style: TextStyle(color: Colors.black),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Size : "),
                                                Text("${SizeofDress[index]}",style: TextStyle(color: Colors.black),),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            FloatingActionButton(
                                              onPressed: () {
                                                if (Counts[index] > 0) {
                                                  Counts[index]--;
                                                }
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                              backgroundColor: Colors.white,
                                              elevation: 2,
                                              mini: true,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Text("${Counts[index]}"),
                                            ),
                                            FloatingActionButton(
                                              onPressed: () {
                                                Counts[index]++;
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                              backgroundColor: Colors.white,
                                              elevation: 2,
                                              mini: true,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Amount:",style: TextStyle(color: Colors.black38),),
                  Text("${calculateTotalPrice()}\$",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                ],
              ),
              Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text("Congratulation!"),
                         duration: Duration(seconds: 3),),

                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Set the desired border radius
                          ),
                        ),
                      ),
                      child: Text("CHECK OUT")))
            ],
          ),
        ),

    );
  }

  int calculateTotalPrice() {
    int total = 0;
    for (int i = 0; i < Counts.length; i++) {
      total += Counts[i] * price[i];
    }
    return total;
  }
}
