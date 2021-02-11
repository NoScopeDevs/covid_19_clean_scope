import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/covid_19_provider.dart';

class LatestCovidDataPage extends ConsumerWidget {
  LatestCovidDataPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(covid19NotifierProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Scope Example Covid19 Data'),
      ),
      body: state.when(
        data: (latestTotals) => ListView(
          children: [
            _ListTile(
              title: 'Casos confirmados',
              subtitle: '${latestTotals.confirmed}',
            ),
            _ListTile(
              title: 'Casos criticos',
              subtitle: '${latestTotals.critical}',
            ),
            _ListTile(
              title: 'Muertes',
              subtitle: '${latestTotals.deaths}',
            ),
            _ListTile(
                title: 'Ultima actualizacion',
                subtitle: '${latestTotals.lastUpdate}'),
          ],
        ),
        initial: () =>
            const Center(child: Text('Presiona el boton para obtener la data')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: ([message]) => const Center(child: Text('error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(covid19NotifierProvider).getCovidData(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    Key key,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
