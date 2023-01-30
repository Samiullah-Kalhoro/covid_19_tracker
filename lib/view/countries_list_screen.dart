
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'detail_screen.dart';
import 'services/states_services.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with country name',
                    hintStyle: const TextStyle(fontWeight: FontWeight.w100),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: statesServices.countriesListApi(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white70,
                              ),
                              title: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white54,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]['country'];
                      if (_searchController.text.isEmpty) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      name: snapshot.data![index]['country'],
                                      active: snapshot.data![index]['active'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      todayRecovered: snapshot.data![index]
                                          ['todayRecovered'],
                                      tests: snapshot.data![index]['tests'],
                                      totalDeaths: snapshot.data![index]
                                          ['deaths'],
                                      totalRecovered: snapshot.data![index]
                                          ['recovered'],
                                      totalCases: snapshot.data![index]
                                          ['cases'],
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                    ),
                                  )),
                              child: ListTile(
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapshot.data![index]['countryInfo']
                                        ['flag'],
                                  ),
                                ),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    "Active Cases : ${snapshot.data![index]['active']}"),
                              ),
                            )
                          ],
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase())) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      name: snapshot.data![index]['country'],
                                      active: snapshot.data![index]['active'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                      todayRecovered: snapshot.data![index]
                                          ['todayRecovered'],
                                      tests: snapshot.data![index]['tests'],
                                      totalDeaths: snapshot.data![index]
                                          ['deaths'],
                                      totalRecovered: snapshot.data![index]
                                          ['recovered'],
                                      totalCases: snapshot.data![index]
                                          ['cases'],
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                    ),
                                  )),
                              child: ListTile(
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapshot.data![index]['countryInfo']
                                        ['flag'],
                                  ),
                                ),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    "Active Cases : ${snapshot.data![index]['active']}"),
                              ),
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
