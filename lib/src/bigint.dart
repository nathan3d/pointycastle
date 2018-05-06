library pointycastle.src.bigint;

import 'dart:typed_data';

// TODO(kevmoo): see if this can be done more efficiently with BigInt
BigInt modPow(BigInt b, BigInt e, BigInt m) {
  if (e < BigInt.one) {
    return BigInt.one;
  }
  if (b < BigInt.zero || b > m) {
    b = b % m;
  }
  var r = BigInt.one;
  while (e > BigInt.zero) {
    if ((e & BigInt.one) > BigInt.zero) {
      r = (r * b) % m;
    }
    e >>= 1;
    b = (b * b) % m;
  }
  return r;
}

BigInt bytes2BigInt(List<int> bytes) {
  var number = BigInt.zero;
  for (var i = 0; i < bytes.length; i++) {
    number = (number << 8) | new BigInt.from(bytes[i]);
  }
  return number;
}

List<int> integer2Bytes(BigInt integer) {
  if (integer < BigInt.one) {
    throw new ArgumentError('Only positive integers are supported.');
  }
  var bytes = new Uint8List((integer.bitLength/8).round());
  for (int i = bytes.length - 1; i >= 0; i--) {
    bytes[i] = (integer & _bigIntFF).toInt();
    integer >>= 8;
  }
  return bytes;
}

final _bigIntFF = new BigInt.from(0xff);

BigInt maxBigInt(BigInt a, BigInt b) {
  return a > b ? a : b;
}