import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/routes.dart';

class VaccaPage extends StatefulWidget {
  const VaccaPage({super.key});

  @override
  State<VaccaPage> createState() => _VaccaPageState();
}

class _VaccaPageState extends State<VaccaPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.homeRoute);
            },
          ),
          title: Center(
            child: Text('All Vaccines'),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                EntryItem(data[index]),
            itemCount: data.length,
          ),
        ),
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    'At Birth',
    <Entry>[
      Entry(
        'BCG',
      ),
      Entry('Hepatitis B'),
      Entry('OPV 0'),
    ],
  ),
  Entry(
    'At 06 Weeks',
    <Entry>[
      Entry('IPV'),
      Entry('PCV'),
      Entry('Hepatitis B'),
      Entry('DTP'),
      Entry('HiB'),
      Entry('Rotavirus'),
    ],
  ),
  Entry(
    'At 10 Weeks',
    <Entry>[
      Entry('DTP'),
      Entry('HiB'),
      Entry('Rotavirus'),
      Entry('IPV'),
      Entry('PCV'),
    ],
  ),
  Entry(
    'At 14 Weeks',
    <Entry>[
      Entry('DTP'),
      Entry('HiB'),
      Entry('IPV'),
      Entry('Rotavirus'),
      Entry('PCV'),
    ],
  ),
  Entry(
    'At 06 Months',
    <Entry>[
      Entry('OPV 1'),
      Entry('Hepatitis B'),
    ],
  ),
  Entry(
    'At 7-8 Months',
    <Entry>[
      Entry('Influenza'),
    ],
  ),
  Entry(
    'At 09 Months',
    <Entry>[
      Entry('OPV'),
      Entry('MMR-1'),
    ],
  ),
  Entry(
    'At 09-12 Months',
    <Entry>[
      Entry('OPV'),
      Entry('MMR-1'),
    ],
  ),
  Entry(
    'At 12 Months',
    <Entry>[
      Entry('Hepatitis A'),
      Entry('Cholera'),
    ],
  ),
  Entry(
    'At 16-18 Months',
    <Entry>[
      Entry('IPV (Booster-1)'),
      Entry('HiB (Booster-1)'),
      Entry('DTP (Booster Dose)'),
    ],
  ),
  Entry(
    'At 18 Months',
    <Entry>[
      Entry('Hepatits A'),
      Entry('JE'),
    ],
  ),
  Entry(
    'At 02 Years',
    <Entry>[
      Entry('TCV'),
    ],
  ),
  Entry(
    'At 04-06 Years',
    <Entry>[
      Entry('DTP(Booster Dose)'),
      Entry('OPV'),
      Entry('Varicella'),
      Entry('MMR3')
    ],
  ),
  Entry(
    'At 10-12 Years',
    <Entry>[
      Entry('Tdap/Td'),
      Entry('HPV'),
    ],
  ),
];

class EntryItem extends StatefulWidget {
  const EntryItem(this.entry);

  final Entry entry;

  @override
  State<EntryItem> createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return ListTile(
        title: Text(root.title),
      );
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.entry);
  }
}
