import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shemsu_suk/bloc/activity_blocc.dart';
import 'package:shemsu_suk/bloc/activity_state.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Groceries',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          backgroundColor: Color.fromARGB(255, 126, 111, 190)),
      backgroundColor: Color.fromARGB(255, 84, 184, 126),
      body: BlocBuilder<itemBloc, itemState>(
        builder: (context, state) {
          if (state is itemInitialState) {
            return const Center(
                child: Text(
              "NO Purchase\n TOTAL: 0\$",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ));
          }
          if (state is itemLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is itemSuccessState) {
            if (state.cartHistory.isEmpty) {
              return const Center(
                  child: Text(
                "NO Purchase\n TOTAL: 0\$",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ));
            } else {
              // ignore: non_constant_identifier_names
              num TotalPrice = 0;
              // ignore: no_leading_underscores_for_local_identifiers
              void _incrementCounter() {
                for (var element in state.cartHistory) {
                  TotalPrice += element.price;
                }
              }

              _incrementCounter();
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height * .84,
                    child: ListView.builder(
                      itemCount: state.cartHistory.length,
                      itemBuilder: (BuildContext context, int index) {
                        final value = state.cartHistory[index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image:
                                                  NetworkImage(value.image))),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .1,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 11, vertical: 5),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(value.title),
                                          Text(
                                            "${value.price}\$",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TOTAL: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
