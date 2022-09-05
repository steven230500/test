import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/pages/detail/bloc/bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Page();
  }
}

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Test3Bloc, Test3State>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              Opacity(
                opacity: 0.4,
                child: Image.network(
                  state.model.movie != null
                      ? 'http://image.tmdb.org/t/p/w500/${state.model.movie!.posterPath}'
                      : 'https://uxwing.com/image-not-found-icon/',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: SafeArea(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 25),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.red.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 8),
                            ], borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                state.model.movie != null
                                    ? 'http://image.tmdb.org/t/p/w500/${state.model.movie!.posterPath}'
                                    : 'https://uxwing.com/image-not-found-icon/',
                                height: 250,
                                width: 180,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 50, top: 70),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.red,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.red.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8)
                                ]),
                            child: Icon(Icons.play_arrow,
                                color: Colors.white, size: 60),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
              )
            ],
          );
        },
      ),
    );
  }
}
