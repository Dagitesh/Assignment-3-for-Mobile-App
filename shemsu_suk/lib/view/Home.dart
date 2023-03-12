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
        backgroundColor: Color.fromARGB(255, 108, 93, 241),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(0, 248, 248, 248)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.amberAccent,
            ),
            label: Text(''),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(0, 255, 255, 255)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(
              Icons.shopping_cart_checkout,
              color: Colors.amberAccent,
            ),
            label: Text(''),
          )
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
                          backgroundColor: Color.fromARGB(252, 81, 83, 172),
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
                            child: Card(
                              color: Color.fromARGB(248, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Image.network(
                                        items.image,
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
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Color.fromARGB(
                                                            255, 7, 202, 209)),
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    BlocProvider.of<itemBloc>(
                                                            context)
                                                        .add(CartHistoryEvent(
                                                            asbeza: items));
                                                    // Implement add to cart functionality
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Color.fromARGB(
                                                                  255,
                                                                  199,
                                                                  4,
                                                                  4)),
                                                  child: Text('Add to Zenbil'),
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
