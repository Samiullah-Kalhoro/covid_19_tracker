
import 'package:flutter/material.dart';

import 'world_states.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
      required this.name,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.tests,
      required this.todayRecovered,
      required this.image})
      : super(key: key);

  final String name;
  final String image;
  final int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      tests,
      todayRecovered;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        ReusableRow(
                            title: 'Total Tests',
                            value: widget.tests.toString()),
                        ReusableRow(
                            title: 'Cases',
                            value: widget.totalCases.toString()),
                        ReusableRow(
                            title: 'Total Recovered',
                            value: widget.totalRecovered.toString()),
                        ReusableRow(
                            title: 'Total Deaths',
                            value: widget.totalDeaths.toString()),
                        ReusableRow(
                            title: 'Active Cases',
                            value: widget.active.toString()),
                        ReusableRow(
                            title: 'Critical Cases',
                            value: widget.critical.toString()),
                        ReusableRow(
                            title: 'Total Recovered',
                            value: widget.totalRecovered.toString()),
                        ReusableRow(
                            title: 'Today Recovered',
                            value: widget.todayRecovered.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(widget.image),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
