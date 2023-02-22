import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weatherapp1/api_fucntion.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      return ListView(
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
                          const SizedBox(
                            height: 8,
                          ),
                          ListTile(
                            title: Text("Longitude"),
                            trailing: Text(snapshot.data.coord.lon.toString()),
                          ),
                          ListTile(
                            title: Text("Latitude"),
                            trailing: Text(snapshot.data.coord.lat.toString()),
                          ),
                          ListTile(
                            title: Text("Feels Like"),
                            trailing:
                                Text(snapshot.data.main.feelsLike.toString()),
                          ),
                          ListTile(
                            title: Text("Minimum Temperature"),
                            trailing:
                                Text(snapshot.data.main.tempMin.toString()),
                          ),
                          ListTile(
                            title: Text("Max Texmperature"),
                            trailing:
                                Text(snapshot.data.main.tempMax.toString()),
                          ),
                          ListTile(
                            title: Text("Pressure"),
                            trailing:
                                Text(snapshot.data.main.pressure.toString()),
                          ),
                          ListTile(
                            title: Text("Humidity"),
                            trailing:
                                Text(snapshot.data.main.humidity.toString()),
                          ),
                          ListTile(
                            title: Text("Visibility"),
                            trailing: Text(snapshot.data.visibility.toString()),
                          ),
                          ListTile(
                            title: Text("Wind Speed"),
                            trailing: Text(snapshot.data.wind.speed.toString()),
                          ),
                          ListTile(
                            title: Text("Clouds"),
                            trailing:
                                Text(snapshot.data.sys.sunrise.toString()),
                          ),
                          ListTile(
                            title: Text("Sun Rise"),
                            trailing: Text(snapshot.data.coord.lon.toString()),
                          ),
                          ListTile(
                            title: Text("Sun Set"),
                            trailing: Text(snapshot.data.sys.sunset.toString()),
                          ),
                        ],
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
