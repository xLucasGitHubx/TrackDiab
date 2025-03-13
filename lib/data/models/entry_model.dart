class EntryModel {
  final String id; // _id
  final String device; // device
  final DateTime date; // date => ex: 1703717509371 (timestamp)
  final String dateString; // dateString => ex: "2023-12-27T22:51:49.371Z"
  final double sgv; // sgv => ex: 146 (converti en double pour le graphe)
  final int delta; // delta => ex: 0
  final String direction; // direction => ex: "Flat"
  final String type; // type => ex: "sgv"
  final int filtered; // filtered => ex: 0
  final int unfiltered; // unfiltered => ex: 0
  final int rssi; // rssi => ex: 100
  final int noise; // noise => ex: 1
  final String sysTime; // sysTime => "2023-12-27T22:51:49.371Z" (String)
  final int utcOffset; // utcOffset => ex: 60

  EntryModel({
    required this.id,
    required this.device,
    required this.date,
    required this.dateString,
    required this.sgv,
    required this.delta,
    required this.direction,
    required this.type,
    required this.filtered,
    required this.unfiltered,
    required this.rssi,
    required this.noise,
    required this.sysTime,
    required this.utcOffset,
  });

  factory EntryModel.fromJson(Map<String, dynamic> json) {
    return EntryModel(
      id: json['_id'] ??
          '', // L'_id est souvent un ObjectId. On le stocke en String
      device: json['device'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(
        // 'date' est 1703717509371 => un int ou double. On convertit en int
        (json['date'] as num).toInt(),
      ),
      dateString: json['dateString'] ?? '',
      sgv: (json['sgv'] as num).toDouble(), // sgv => Int, converti en double
      delta: (json['delta'] as num).toInt(),
      direction: json['direction'] ?? '',
      type: json['type'] ?? '',
      filtered: (json['filtered'] as num).toInt(),
      unfiltered: (json['unfiltered'] as num).toInt(),
      rssi: (json['rssi'] as num).toInt(),
      noise: (json['noise'] as num).toInt(),
      sysTime: json['sysTime'] ??
          '', // On le laisse en String si on n’en a pas besoin en DateTime
      utcOffset: (json['utcOffset'] as num).toInt(),
    );
  }
}
