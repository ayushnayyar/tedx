import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

bool _open = false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Item> _homeExpansionList = [
    Item(
      headerValue: 'Watch TEDx talks',
      expandedValue: 'Playlist of all TED talks',
      buttonValue: 'Watch',
      url: 'https:www.ted.com/talks',
    ),
    Item(
      headerValue: 'Find an event near you',
      expandedValue:
          'TEDx events are planned and coordinated independently, on a community-by-community basis, under a free license from TED',
      buttonValue: 'Find',
      url: 'https:www.ted.com/tedx/events',
    ),
    Item(
      headerValue: 'Apply for a license',
      expandedValue:
          'Start the application process to host your own TEDx event',
      buttonValue: 'Apply',
      url:
          'https://www.ted.com/participate/organize-a-local-tedx-event/apply-for-a-tedx-license',
    ),
    Item(
      headerValue: 'Partner with TEDx',
      expandedValue: 'Bring the magic of TEDx to your company',
      buttonValue: 'Partner',
      url:
          'https://www.ted.com/about/programs-initiatives/tedx-program/partner-with-tedx',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          _open = !_open;
          return true;
        },
        child: Scaffold(
          floatingActionButton: InformationFloatingButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: Color(0xFFE62B1E),
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.black,
            title: Text(
              'TEDx',
              style: TextStyle(
                color: Color(0xFFE62B1E),
                fontWeight: FontWeight.w900,
                fontSize: 27.5,
              ),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.only(bottom: 100.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'About TEDx JNEC',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 26.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Text(
                  'TEDxJNEC aims towards social, industrial and educational development of our city. This event is a huge opportunity for all citizens to think out of the box and witness a whole new level of determination, perseverance and success. TEDx brings to you the spirit of TED, mission of ideas worth spreading to local communities around the globe. '
                  '\n\nTEDx events are organised by curious individuals who seek to discover ideas and spark conversations in their own community. TEDx events include live speakers and recorded TED talks and are organised independently under a free license granted by TED.'
                  '\n\nTED is a nonprofit devoted to spreading ideas, usually in the form of short, powerful talks (18 minutes or less). TED began in 1984 as a conference where Technology, Entertainment and Design converged, and today covers almost all topics from science to business to global issues in more than 100 languages.',
                  textAlign: TextAlign.justify,
                ),
              ),
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _homeExpansionList[index].isExpanded = !isExpanded;
                  });
                },
                children: _homeExpansionList.map<ExpansionPanel>((Item item) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(item.headerValue),
                      );
                    },
                    body: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(
                        15.0,
                        0.0,
                        15.0,
                        10.0,
                      ),
                      title: Text(item.expandedValue),
                      subtitle: Center(
                        child: FlatButton(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          color: Color(0xFFE61B1E),
                          onPressed: () {
                            print(item.url);
                            _launchURL(item.url);
                          },
                          child: Text(
                            item.buttonValue,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationFloatingButton extends StatefulWidget {
  @override
  _InformationFloatingButtonState createState() =>
      _InformationFloatingButtonState();
}

class _InformationFloatingButtonState extends State<InformationFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      child: FloatingActionButton(
        onPressed: () {
          if (!_open) {
            showBottomSheet(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
              ),
              context: context,
              builder: (context) => GestureDetector(
                onVerticalDragStart: (_) {},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      topLeft: Radius.circular(16.0),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Container(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            left: 10.0,
                            bottom: 10.0,
                          ),
                          child: Text(
                            'TEDx Program',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25.0,
                              color: Color(0xFFE61B1E),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                            left: 10.0,
                            right: 10.0,
                            bottom: 25.0,
                          ),
                          child: Text(
                            'TEDx is a grassroots initiative, created in the spirit of TED’s overall mission to research and discover “ideas worth spreading.” TEDx brings the spirit of TED to local communities around the globe through TEDx events. These events are organized by passionate individuals who seek to uncover new ideas and to share the latest research in their local areas that spark conversations in their communities. TEDx events include live speakers and recorded TED Talks, and are organized independently under a free license granted by TED. These events are not controlled by TED, but event organizers agree to abide by our format, and are offered guidelines for curation, speaker coaching, event organizing and more. They learn from us and from each other. More than 3000 events are now held annually.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            Navigator.pop(context);
          }
          setState(() {
            print(_open);
            _open = !_open;
          });
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Information',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.buttonValue,
    this.url,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  String buttonValue;
  String url;
  bool isExpanded;
}
