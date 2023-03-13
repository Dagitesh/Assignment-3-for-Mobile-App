import 'package:shemsu_suk/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shemsu_suk/model/item.dart';

import '../bloc/activity_blocc.dart';
import '../bloc/activity_event.dart';
import '../bloc/activity_state.dart';
import 'cart.dart';

class item extends StatefulWidget {
  const item({super.key});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Groceries',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 132, 121, 236),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 17, 221, 51),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Color.fromARGB(255, 17, 221, 51),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => cart()));
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 161, 233, 199),
      body: Center(
        child: BlocBuilder<itemBloc, itemState>(builder: (context, state) {
          if (state is itemInitialState) {
            return Column(
              children: [
                SizedBox(
                  width: 1000,
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4xQN71B-QfKGRTGPJLFXOwtDSOQPlGFw8Rg&usqp=CAU'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(251, 102, 104, 202),
                          fixedSize: Size(150, 80)),
                      onPressed: () {
                        BlocProvider.of<itemBloc>(context)
                            .add(GetDataButtonPressed());
                      },
                      child: const Text('Shop Now!')),
                ),
              ],
            );
          } else if (state is itemLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is itemFailState) {
            return Text(state.message);
          } else if (state is itemSuccessState) {
            return ListView.builder(
              itemCount: state.activity.length,
              itemBuilder: (BuildContext context, int index) {
                final items = state.activity[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Row(
                      children: [
                        Center(
                          child: SizedBox(
                            width: 360,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: Color.fromARGB(248, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Image.network(
                                        items.image,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .4,
                                                  child: Text(
                                                    items.title,
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .1,
                                                  child: Text(
                                                    '${items.price}', // Replace with actual price
                                                    // ignore: prefer_const_constructors
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        // ignore: prefer_const_constructors
                                                        color: Color.fromARGB(
                                                            255, 7, 202, 209)),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                ElevatedButton.icon(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          shape: CircleBorder(),
                                                          padding: EdgeInsets
                                                              .all(10),
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  223,
                                                                  40,
                                                                  7),
                                                          minimumSize:
                                                              const Size(50, 8),
                                                          alignment:
                                                              Alignment.center,
                                                          elevation: 10),
                                                  onPressed: () {
                                                    BlocProvider.of<itemBloc>(
                                                            context)
                                                        .add(
                                                            PurchaseHistoryEvent(
                                                                asbeza: items));
                                                  },
                                                  icon: const Icon(
                                                      Icons.add_shopping_cart),
                                                  label: Text(""),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        }),
      ),
    );
  }
}
