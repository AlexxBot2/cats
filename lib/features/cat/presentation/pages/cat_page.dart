import 'dart:async';

import 'package:cats/core/theme/colors.dart';
import 'package:cats/core/theme/theme.dart';
import 'package:cats/features/cat/data/models/cat.dart';
import 'package:cats/features/cat/presentation/bloc/cat_bloc.dart';
import 'package:cats/features/cat/presentation/widgets/cat_item_widget.dart';
import 'package:cats/core/widgets/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  late final CatBloc catBloc;
  List<Cat> catList = [];
  List<Cat> catListFiltered = [];
  Timer? _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catBloc = BlocProvider.of<CatBloc>(context);
    catBloc.add(GetCatListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<CatBloc, CatState>(
            bloc: catBloc,
            listener: (context, state) {
              if (state is ErrorState) {
                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text(state.message)));
              }
              if (state is CatListState) {
                catList = state.catList;
                catListFiltered = state.catList;
              }
              if (state is CatListFilteredState) {
                catListFiltered = state.catListFiltered;
              }
            },
            builder: (context, state) {
              if (state is LoadingState) {
                return const SplashPage();
              }
              if (state is ErrorState) {
                return ElevatedButton(
                    onPressed: () {
                      catBloc.add(GetCatListEvent());
                    },
                    child: const Text('Retry'));
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const Text('Catbreeds', style: AppTheme.titleTextStyle,),
                    const SizedBox(height: 10,),
                    TextField(
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce?.cancel();
                        _debounce =
                            Timer(const Duration(milliseconds: 100), () {
                          catBloc.add(GetCatListFilteredEvent(catList, value));
                        });
                      },
                      style: AppTheme.normalTextStyle,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search, color: AppColor.primaryColor,),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.inputBorderColor,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.inputBorderColor,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor.inputBorderColor, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          hintText: 'Search by breed',
                          labelText: 'Search',
                          labelStyle: AppTheme.smallTextStyle.copyWith(
                              fontSize: 14,
                              color: AppColor.inputBorderColor,
                              fontWeight: FontWeight.w400),
                          hintStyle: AppTheme.smallTextStyle.copyWith(
                              fontSize: 14,
                              color: AppColor.inputBorderColor,
                              fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: RefreshIndicator.adaptive(
                        onRefresh: () async {
                          catBloc.add(GetCatListEvent());
                        },
                        child: Scrollbar(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CatItemWidget(cat: catListFiltered[index]);
                            },
                            itemCount: catListFiltered.length,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

