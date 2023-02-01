class Lb1500 {
  final double nps;
  final double? d1;
  final double? d2;
  final double? d3;
  final double? d4;
  final double? gasketF;
  final int? boltNo;
  final int? boltArea1;
  final String? type;
  final int? metric;
  final double? sealingArea;

  const Lb1500({
    required this.nps,
    this.d1,
    this.d2,
    this.d3,
    this.d4,
    this.gasketF,
    this.boltNo,
    this.boltArea1,
    this.type,
    this.metric,
    this.sealingArea,
  });
}

const allLb1500 = [
  Lb1500(
      nps: 0.50,
      d1: 14,
      d2: 19.1,
      d3: 31.8,
      d4: 63.5,
      gasketF: 19.1,
      boltNo: 4,
      boltArea1: 195,
      type: ' 3/4',
      metric: null,
      sealingArea: 2030.819739),
  Lb1500(
      nps: 0.75,
      d1: 21,
      d2: 25.4,
      d3: 39.6,
      d4: 69.9,
      gasketF: 26.2,
      boltNo: 4,
      boltArea1: 195,
      type: ' 3/4',
      metric: null,
      sealingArea: 2899.690019),
  Lb1500(
      nps: 1.00,
      d1: 27,
      d2: 31.8,
      d3: 47.8,
      d4: 79.5,
      gasketF: 33.5,
      boltNo: 4,
      boltArea1: 270,
      type: ' 7/8',
      metric: 24,
      sealingArea: 4001.132404),
  Lb1500(
      nps: 1.25,
      d1: 38,
      d2: 39.6,
      d3: 60.5,
      d4: 88.9,
      gasketF: 44.2,
      boltNo: 4,
      boltArea1: 270,
      type: ' 7/8',
      metric: null,
      sealingArea: 6572.494575),
  Lb1500(
      nps: 1.50,
      d1: 45,
      d2: 47.8,
      d3: 69.9,
      d4: 98.6,
      gasketF: 53.1,
      boltNo: 4,
      boltArea1: 356,
      type: '1',
      metric: 27,
      sealingArea: 8171.816563),
  Lb1500(
      nps: 2.00,
      d1: 56,
      d2: 58.7,
      d3: 85.9,
      d4: 143,
      gasketF: 67.3,
      boltNo: 8,
      boltArea1: 270,
      type: ' 7/8',
      metric: 24,
      sealingArea: 12356.2609),
  Lb1500(
      nps: 2.50,
      d1: 67,
      d2: 69.9,
      d3: 98.6,
      d4: 165.1,
      gasketF: 79.5,
      boltNo: 8,
      boltArea1: 356,
      type: '1',
      metric: 27,
      sealingArea: 15192.58499),
  Lb1500(
      nps: 3.00,
      d1: 81,
      d2: 92.2,
      d3: 120.7,
      d4: 174.8,
      gasketF: 101.7,
      boltNo: 8,
      boltArea1: 470,
      type: '1 1/8',
      metric: 30,
      sealingArea: 19062.08466),
  Lb1500(
      nps: 4.00,
      d1: 106,
      d2: 117.6,
      d3: 149.4,
      d4: 209.6,
      gasketF: 129.3,
      boltNo: 8,
      boltArea1: 599,
      type: '1 1/4',
      metric: 33,
      sealingArea: 26674.00658),
  Lb1500(
      nps: 5.00,
      d1: 132,
      d2: 143,
      d3: 177.8,
      d4: 254,
      gasketF: 156.8,
      boltNo: 8,
      boltArea1: 907,
      type: '1 1/2',
      metric: null,
      sealingArea: 35072.23773),
  Lb1500(
      nps: 6.00,
      d1: 157,
      d2: 171.5,
      d3: 209.6,
      d4: 282.7,
      gasketF: 187.6,
      boltNo: 12,
      boltArea1: 745,
      type: '1 3/8',
      metric: 35,
      sealingArea: 45615.64259),
  Lb1500(
      nps: 8.00,
      d1: 216,
      d2: 215.9,
      d3: 257.3,
      d4: 352.6,
      gasketF: 234.4,
      boltNo: 12,
      boltArea1: 1084,
      type: '1 5/8',
      metric: 42,
      sealingArea: 61545.30805),
  Lb1500(
      nps: 10.00,
      d1: 268,
      d2: 266.7,
      d3: 311.2,
      d4: 435.1,
      gasketF: 287.4,
      boltNo: 12,
      boltArea1: 1487,
      type: '1 7/8',
      metric: 52,
      sealingArea: 80790.92456),
  Lb1500(
      nps: 12.00,
      d1: 318,
      d2: 323.9,
      d3: 368.3,
      d4: 520.7,
      gasketF: 344.6,
      boltNo: 16,
      boltArea1: 1711,
      type: '2    ',
      metric: 54,
      sealingArea: 96552.70331),
  Lb1500(
      nps: 14.00,
      d1: 349,
      d2: 362,
      d3: 400.1,
      d4: 577.9,
      gasketF: 378.1,
      boltNo: 16,
      boltArea1: 2209,
      type: '2 1/4',
      metric: 58,
      sealingArea: 91219.31571),
  Lb1500(
      nps: 16.00,
      d1: 400,
      d2: 406.4,
      d3: 457.2,
      d4: 641.4,
      gasketF: 431.8,
      boltNo: 16,
      boltArea1: 2469,
      type: '2 1/2',
      metric: 64,
      sealingArea: 137824.4343),
  Lb1500(
      nps: 18.00,
      d1: 449,
      d2: 463.6,
      d3: 520.7,
      d4: 704.9,
      gasketF: 493.8,
      boltNo: 16,
      boltArea1: 3393,
      type: '2 3/4',
      metric: 74,
      sealingArea: 176568.597),
  Lb1500(
      nps: 20.00,
      d1: 500,
      d2: 514.4,
      d3: 571.5,
      d4: 755.7,
      gasketF: 544.6,
      boltNo: 16,
      boltArea1: 4080,
      type: '3    ',
      metric: 80,
      sealingArea: 194794.1069),
  Lb1500(
      nps: 24.00,
      d1: 603,
      d2: 616,
      d3: 679.5,
      d4: 901.7,
      gasketF: 651.1,
      boltNo: 16,
      boltArea1: 5645,
      type: '3 1/2',
      metric: 94,
      sealingArea: 258440.7635),
];