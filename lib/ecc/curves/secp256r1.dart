

// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastle.impl.ec_domain_parameters.secp256r1;

import "package:bignum/bignum.dart";

import "package:pointycastle/ecc/ecc_base.dart";
import "package:pointycastle/src/registry/registry.dart";
import "package:pointycastle/src/ec_standard_curve_constructor.dart";

class ECCurve_secp256r1 extends ECDomainParametersImpl {

  static final FactoryConfig FACTORY_CONFIG =
  new StaticFactoryConfig("secp256r1");

  factory ECCurve_secp256r1() => constructFpStandardCurve("secp256r1",
    ECCurve_secp256r1._make,
    q: new BigInteger("ffffffff00000001000000000000000000000000ffffffffffffffffffffffff", 16),
    a: new BigInteger("ffffffff00000001000000000000000000000000fffffffffffffffffffffffc", 16),
    b: new BigInteger("5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b", 16),
    g: new BigInteger("046b17d1f2e12c4247f8bce6e563a440f277037d812deb33a0f4a13945d898c2964fe342e2fe1a7f9b8ee7eb4a7c0f9e162bce33576b315ececbb6406837bf51f5", 16),
    n: new BigInteger("ffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551", 16),
    h: new BigInteger("1", 16),
    seed: new BigInteger("c49d360886e704936a6678e1139d26b7819f7e90", 16)
  );

  static ECCurve_secp256r1 _make(domainName, curve, G, n, _h, seed) =>
    new ECCurve_secp256r1._super(domainName, curve, G, n, _h, seed);

  ECCurve_secp256r1._super(domainName, curve, G, n, _h, seed)
    : super(domainName, curve, G, n, _h, seed);

}