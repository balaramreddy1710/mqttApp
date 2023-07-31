class Air {
  int? deviceVersion;
  int? time;
  String? mac;
  double? tempR1;
  late double pressure;
  double? co2;
  late double temp;
  double? humidR1;
  double? tvoc;
  late double rltHumid;
  double? tempR2;
  double? lux;
  late double pm1;
  late double pm2_5;
  late double pm4;
  late double pm10;
  double? noiseLevel;
  int? occupancyState;
  int? pktId;
  int? deviceType;

  Air(
      {this.deviceVersion,
      this.time,
      this.mac,
      this.tempR1,
      required this.pressure,
      this.co2,
      required this.temp,
      this.humidR1,
      this.tvoc,
      required this.rltHumid,
      this.tempR2,
      this.lux,
      required this.pm1,
      required this.pm2_5,
      required this.pm4,
      required this.pm10,
      this.noiseLevel,
      this.occupancyState,
      this.pktId,
      this.deviceType});

  Air.fromJson(Map<String, dynamic> json) {
    deviceVersion = json['DeviceVersion'];
    time = json['Time'];
    mac = json['MAC'];
    tempR1 = json['Temperature_R1'];
    pressure = json['Pressure'];
    co2 = json['CO2'];
    temp = json['Temperature'];
    humidR1 = json['Humidity_R1'];
    tvoc = json['TVoc'];
    rltHumid = json['RelativeHumidity'];
    tempR2 = json['Temperature_R2'];
    lux = json['Lux'];
    pm1 = json['Pm1'];
    pm2_5 = json['Pm2_5'];
    pm4 = json['Pm4'];
    pm10 = json['Pm10'];
    noiseLevel = json['NoiseLevel'];
    occupancyState = json['OccupancyState'];
    pktId = json['PktId'];
    deviceType = json['DeviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DeviceVersion'] = deviceVersion;
    data['Time'] = time;
    data['MAC'] = mac;
    data['Temperature_R1'] = tempR1;
    data['Pressure'] = pressure;
    data['Co2'] = co2;
    data['Temperature'] = temp;
    data['Humidity_R1'] = humidR1;
    data['TVoc'] = tvoc;
    data['RelativeHumidity'] = rltHumid;
    data['Temperature_R2'] = tempR2;
    data['Lux'] = lux;
    data['Pm1'] = pm1;
    data['Pm2_5'] = pm2_5;
    data['Pm4'] = pm4;
    data['Pm10'] = pm10;
    data['NoiseLevel'] = noiseLevel;
    data['OccupancyState'] = occupancyState;
    data['PktId'] = pktId;
    data['DeviceType'] = deviceType;
    return data;
  }
}


class Inout {
  int? time;
  late int? inn;
  late int? out;
  late int? balance;

  Inout(
      {this.time,required this.inn,required this.out,required this.balance,});

  Inout.fromJson(Map<String, dynamic> json) {
    time = json['Time'];
    inn = json['In'];
    out = json['Out'];
    balance = json['Balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Time'] = time;
    data['In'] = inn;
    data['Out'] = out;
    data['Balance'] = balance;
    return data;
  }
}

class Pc {
  late String? mac;
  int? time;
  late String? cputil;
  double? ramutil;
  double? cputemp;
  double? diskutil;
  late String? vlvl;
  int? pktId;
  int? deviceType;
  late int? peoplecount;

  Pc(
      {
      required this.mac,
      this.time,
      required this.cputil,
      this.ramutil,
      this.cputemp,
      this.diskutil,
      required this.vlvl,
      this.pktId,
      this.deviceType,
      required this.peoplecount});

  Pc.fromJson(Map<String, dynamic> json) {
    mac = json['MAC'];
    time = json['Time'];
    cputil = json['CPU Utilization'];
    ramutil = json['RAM Utilization'];
    cputemp = json['CPU Temperature'];
    diskutil = json['Disk Utilization'];
    vlvl = json['Voltage Level'];
    pktId = json['PktId'];
    deviceType = json['DeviceType'];
    peoplecount = json['PeopleCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MAC'] = mac;
    data['Time'] = time;
    data['CPU Utilization'] = cputil;
    data['RAM Utilization'] = ramutil;
    data['CPU Temperature'] = cputemp;
    data['Disk Utilization'] = diskutil;
    data['Voltage Level'] = vlvl;
    data['PktId'] = pktId;
    data['DeviceType'] = deviceType;
    data['PeopleCount'] = peoplecount;
    return data;
  }
}

