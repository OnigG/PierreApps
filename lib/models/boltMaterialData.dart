class BoltMaterialData {
  final String boltClass;
  final int tensile;
  final int boltYield;

  const BoltMaterialData(
      {required this.boltClass,
      required this.tensile,
      required this.boltYield});
}

const allBoltMaterialData = [
  BoltMaterialData(boltClass: 'ASTM A193 B7', tensile: 860, boltYield: 720),
  BoltMaterialData(
      boltClass: 'ASTM A193 B8M Class 1', tensile: 515, boltYield: 205),
  BoltMaterialData(
      boltClass: 'ASTM A193 B8M Class 2*', tensile: 620, boltYield: 345),
  BoltMaterialData(boltClass: 'AS 4291 Gr 4.6', tensile: 400, boltYield: 240),
  BoltMaterialData(boltClass: 'AS 4291 Gr 8.8', tensile: 800, boltYield: 640),
  BoltMaterialData(boltClass: 'AS 4291 Gr 10.9', tensile: 1000, boltYield: 900),
];
