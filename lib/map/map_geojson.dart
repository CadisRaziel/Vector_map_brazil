import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:vector_map/vector_map.dart';

class MapGeoJson extends StatefulWidget {
  const MapGeoJson({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExampleState();
}

class ExampleState extends State<MapGeoJson> {
  VectorMapController? _controller;
  MapDebugger debugger = MapDebugger();

  @override
  void initState() {
    super.initState();
    _loadDataSources();
  }

  void _loadDataSources() async {
    String geoJson = await rootBundle.loadString('/estados.geojson');
    MapDataSource ds = await MapDataSource.geoJson(geoJson: geoJson);
    MapLayer layer = MapLayer(
      dataSource: ds,
      highlightTheme: MapHighlightTheme(color: Colors.green),
    );
    setState(() {
      _controller =
          VectorMapController(layers: [layer], delayToRefreshResolution: 0);
    });
  }

  String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';
  String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
  String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
  String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
  String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';

  @override
  Widget build(BuildContext context) {
    Widget? content;
    if (_controller != null) {
      VectorMap map = VectorMap(
          controller: _controller,
          clickListener: (feature) {
            String estados() {
              switch (feature.id) {
                case 1:
                  return 'Acre';
                case 2:
                  return 'Alagoas';
                case 3:
                  return 'Amazonas';
                case 4:
                  return 'Amapá';
                case 5:
                  return 'Bahia';
                case 6:
                  return 'Ceará';
                case 7:
                  return 'Distrito Federal';
                case 8:
                  return 'Espírito Santo';
                case 9:
                  return 'Goiás';
                case 10:
                  return 'Maranhão';
                case 11:
                  return 'Minas Gerais';
                case 12:
                  return 'Mato Grosso do Sul';
                case 13:
                  return 'Mato Grosso';
                case 14:
                  return 'Pará';
                case 15:
                  return 'Paranaíba';
                case 16:
                  return 'Pernambuco';
                case 17:
                  return 'Piauí';
                case 18:
                  return 'Paraná';
                case 19:
                  return 'Rio de Janeiro';
                case 20:
                  return 'Rio Grande do Norte';
                case 21:
                  return 'Rondônia';
                case 22:
                  return 'Roraima';
                case 23:
                  return 'Rio Grande do Sul';
                case 24:
                  return 'Santa Catarina';
                case 25:
                  return 'Sergipe';
                case 26:
                  return 'São Paulo';
                case 27:
                  return 'Tocantins';
                default:
                  return '';
              }
            }

            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                      backgroundColor: Colors.white,
                      title: Center(
                          child: Text(
                        'Estado: ${estados()}',
                      )),
                      content: Card(
                        color: Colors.amber,
                        elevation: 5,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(horseUrl),
                                  ),
                                  title: Text('I like icecream'),
                                  subtitle: Text('Icream is good for health'),
                                  trailing: Icon(Icons.food_bank),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(horseUrl),
                                  ),
                                  title: Text('I like icecream'),
                                  subtitle: Text('Icream is good for health'),
                                  trailing: Icon(Icons.food_bank),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(horseUrl),
                                  ),
                                  title: Text('I like icecream'),
                                  subtitle: Text('Icream is good for health'),
                                  trailing: Icon(Icons.food_bank),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(horseUrl),
                                  ),
                                  title: Text('I like icecream'),
                                  subtitle: Text('Icream is good for health'),
                                  trailing: Icon(Icons.food_bank),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(horseUrl),
                                  ),
                                  title: Text('I like icecream'),
                                  subtitle: Text('Icream is good for health'),
                                  trailing: Icon(Icons.food_bank),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(horseUrl),
                                  ),
                                  title: Text('I like icecream'),
                                  subtitle: Text('Icream is good for health'),
                                  trailing: Icon(Icons.food_bank),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(horseUrl),
                                  ),
                                  title: Text('I like icecream'),
                                  subtitle: Text('Icream is good for health'),
                                  trailing: Icon(Icons.food_bank),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                child: Text(
                                  "Ok",
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ),
                      ],
                    ));
          });

      Widget buttonsAndMap = Column(
        children: [
          Expanded(child: map),
        ],
      );

      content = buttonsAndMap;
      content = Center(
        child: Row(
          children: [
            Expanded(child: buttonsAndMap),
          ],
        ),
      );
    }

    return SizedBox(
      height: 800,
      width: 800,
      child: content,
    );
  }
}
