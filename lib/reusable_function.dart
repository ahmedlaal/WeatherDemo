import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp1/api_fucntion.dart';

reuse(String objname, var objdata) {
  return FutureBuilder(
      future: getwaetherdata(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListTile(
            title: Text(objname),
            trailing: Text(snapshot.data.Coord.lon),
          );
        } else {
          return CircularProgressIndicator();
        }
      });
}
