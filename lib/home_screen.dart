import 'package:flutter/material.dart';
import 'package:weatherapp1/api_fucntion.dart';
import 'package:weatherapp1/main_file.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Icon(
          Icons.search,
          size: 30,
        ),
        actions: const [Icon(Icons.more_horiz)],
      ),
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff3E60DC),
          Color(0xff5B92E5),
          Color(0xff5C8EE7),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: InkWell(
          onTap: () {},
          child: Container(
              alignment: Alignment.center,
              child: FutureBuilder(
                  future: getwaetherdata(),
                  builder: (context, AsyncSnapshot snapshot) {
                    // return Text("${snapshot.data.visibility}");
                    if (snapshot.hasData) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()));
                        },
                        child: ListView(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Text(
                                "${snapshot.data.name}",
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            // ListView.builder(itemBuilder: itemBuilder)
                            Center(
                              child: Text(
                                "${snapshot.data.sys.country}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                "${snapshot.data.main.temp}",
                                style: const TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                            ),
                            Image.asset(
                              "assets/weather.png",
                              height: 150,
                              width: 150,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
