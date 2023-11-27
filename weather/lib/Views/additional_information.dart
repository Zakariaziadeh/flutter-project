import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18);

Widget additionalInformation(
    String wind, String humidity, String pressure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    child: Column(
      // Remove 'const' here
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wind',
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "pressure",
                  style: titleFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "$pressure",
                  style: infoFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Humidity',
                  style: titleFont,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Feels like",
                  style: titleFont,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$humidity",
                  style: infoFont,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "$feels_like",
                  style: infoFont,
                )
              ],
            ),
          ],
        )
      ],
    ),
  );
}
