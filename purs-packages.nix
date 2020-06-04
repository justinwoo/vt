{ pkgs ? import <nixpkgs> {} }:

{
  "aff" = {
    name = "aff";
    version = "v5.1.2";
    src = pkgs.fetchgit {
      url = "https://github.com/slamdata/purescript-aff.git";
      rev = "v5.1.2";
      sha256 = "1ygjxbm2bqw82sm17szhzz4jihvbg9mszx1ii0n3sj72bnz02avz";
    };
  };
  "arraybuffer-types" = {
    name = "arraybuffer-types";
    version = "v2.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-contrib/purescript-arraybuffer-types.git";
      rev = "v2.0.0";
      sha256 = "059a8n49yhl46l1b1j2qj4ichzq6dzj29ajkfvw88npzj5w2rshy";
    };
  };
  "arrays" = {
    name = "arrays";
    version = "v5.3.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-arrays.git";
      rev = "v5.3.1";
      sha256 = "1z8i4mr30mjsvmw743g0m1yxfgqa9rhbgq7jq3955mg7j80j5r7w";
    };
  };
  "avar" = {
    name = "avar";
    version = "v3.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/slamdata/purescript-avar.git";
      rev = "v3.0.0";
      sha256 = "14g05jm2xricy5b9vn4k4lhc9lzi5jvpvv85h10s17kn4wwi9igk";
    };
  };
  "bifunctors" = {
    name = "bifunctors";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-bifunctors.git";
      rev = "v4.0.0";
      sha256 = "1bdra5fbkraglqrrm484vw8h0wwk48kzkn586v4y7fg106q1q386";
    };
  };
  "bonjiri" = {
    name = "bonjiri";
    version = "v0.7.0";
    src = pkgs.fetchgit {
      url = "https://github.com/justinwoo/purescript-bonjiri.git";
      rev = "v0.7.0";
      sha256 = "08jr5vz6d6l6mflvxnb8fhi84lwyps10lmygcsb3gdvmysdq8jhs";
    };
  };
  "calpis" = {
    name = "calpis";
    version = "v0.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/justinwoo/purescript-calpis.git";
      rev = "v0.1.0";
      sha256 = "0npivy7cvg6g58x2xgsg1zr5hagpvd1acrn9bbvr2gi4vjy7x4g7";
    };
  };
  "catenable-lists" = {
    name = "catenable-lists";
    version = "v5.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-catenable-lists.git";
      rev = "v5.0.1";
      sha256 = "0mbpb8xr9a7a4bvawhki7js5cbv7c0lv0vdwb6r8nmv6b61gzg27";
    };
  };
  "choco-pie" = {
    name = "choco-pie";
    version = "v5.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/justinwoo/purescript-chocopie.git";
      rev = "v5.0.0";
      sha256 = "1q3xilbk8chsy3c07jal9j8nmcvmydk0kvdv9nrbffpxqc02n457";
    };
  };
  "console" = {
    name = "console";
    version = "v4.4.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-console.git";
      rev = "v4.4.0";
      sha256 = "1w9k2g242lvyv4npb5rqfbdq1ngh7s7v12zarxn8yxgq15palh3m";
    };
  };
  "const" = {
    name = "const";
    version = "v4.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-const.git";
      rev = "v4.1.0";
      sha256 = "0qbd2aisax52yw6sybdhs7na943cbsd6mylhhgsamrf7hzh6v51p";
    };
  };
  "contravariant" = {
    name = "contravariant";
    version = "v4.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-contravariant.git";
      rev = "v4.0.1";
      sha256 = "0dd17lwlybpz4i54cxnqdgy38rjlbw9p7bw1r43is6z3kdc8983a";
    };
  };
  "control" = {
    name = "control";
    version = "v4.2.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-control.git";
      rev = "v4.2.0";
      sha256 = "1nm45khn2dvlyv059nzpz1w7d3nfsvq45hnb2qllrbzyv7rlxmi8";
    };
  };
  "datetime" = {
    name = "datetime";
    version = "v4.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-datetime.git";
      rev = "v4.1.1";
      sha256 = "06ghfvbvd5sd0q014qi8j8glk2g2j9f8z8cwq2318kllp92gz07q";
    };
  };
  "debug" = {
    name = "debug";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/garyb/purescript-debug.git";
      rev = "v4.0.0";
      sha256 = "0gwjj80akys0h111i74n429fmny992gx0r4rk1n98gqlqm5cmi21";
    };
  };
  "distributive" = {
    name = "distributive";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-distributive.git";
      rev = "v4.0.0";
      sha256 = "0zbn0yq1vv7fbbf1lncg80irz0vg7wnw9b9wrzxhdzpbkw4jinsl";
    };
  };
  "effect" = {
    name = "effect";
    version = "v2.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-effect.git";
      rev = "v2.0.1";
      sha256 = "1vqw5wrdxzh1ww6z7271xr4kg4mx0r3k3mwg18dmgmzj11wbn2wh";
    };
  };
  "either" = {
    name = "either";
    version = "v4.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-either.git";
      rev = "v4.1.1";
      sha256 = "12j7vvjly0bgxidxmb2pflx0zy7x425dnvxk2y1pm66n0hbsq7ns";
    };
  };
  "enums" = {
    name = "enums";
    version = "v4.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-enums.git";
      rev = "v4.0.1";
      sha256 = "0qq0pgmq497nfml0y8xb2qdpga5xqp9sqq4ilv1rpyhg1v7nzb6v";
    };
  };
  "event" = {
    name = "event";
    version = "v1.3.0";
    src = pkgs.fetchgit {
      url = "https://github.com/paf31/purescript-event.git";
      rev = "v1.3.0";
      sha256 = "0kqlywyzhlw108fq684zcq9bfj19jbwkajancm9w4bb3jd522ca8";
    };
  };
  "exceptions" = {
    name = "exceptions";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-exceptions.git";
      rev = "v4.0.0";
      sha256 = "17s0rg9k4phivhx9j3l2vqqfdhk61gpj1xfqy8w6zj3rnxj0b2cv";
    };
  };
  "exists" = {
    name = "exists";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-exists.git";
      rev = "v4.0.0";
      sha256 = "0bbdbw3jaqyi8dj2d52zvfgx4vl84d8cr6hp43vy8lfjfcbj0wlk";
    };
  };
  "filterable" = {
    name = "filterable";
    version = "v3.0.2";
    src = pkgs.fetchgit {
      url = "https://github.com/LiamGoodacre/purescript-filterable.git";
      rev = "v3.0.2";
      sha256 = "0pn66mrgrpnlpd1lmywj5f0hbm9mnyjahqj276vz5v2xzlr0q63g";
    };
  };
  "foldable-traversable" = {
    name = "foldable-traversable";
    version = "v4.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-foldable-traversable.git";
      rev = "v4.1.1";
      sha256 = "03x89xcmphckzjlp4chc7swrpw347ll5bvr2yp7x9v2jqw2jlyi1";
    };
  };
  "foreign" = {
    name = "foreign";
    version = "v5.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-foreign.git";
      rev = "v5.0.0";
      sha256 = "15mz2s4f8crkd721z4df2aag4s0wil6fs07cpcmi7dpnkn7a4nab";
    };
  };
  "foreign-object" = {
    name = "foreign-object";
    version = "v2.0.3";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-foreign-object.git";
      rev = "v2.0.3";
      sha256 = "07wiql59zfj901nk9526b6rykn9m24jjcs8v5dgxbr1c3hiab9n3";
    };
  };
  "free" = {
    name = "free";
    version = "v5.2.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-free.git";
      rev = "v5.2.0";
      sha256 = "1bwj0ay7q9lm4ir29jy549m05jvaqik1s615biv23y51ngx3fn49";
    };
  };
  "functions" = {
    name = "functions";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-functions.git";
      rev = "v4.0.0";
      sha256 = "0675k5kxxwdvsjs6a3is8pwm3hmv0vbcza1b8ls10gymmfz3k3hj";
    };
  };
  "functors" = {
    name = "functors";
    version = "v3.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-functors.git";
      rev = "v3.1.1";
      sha256 = "1cnn3zhk6qcyiwbbpvrdqgsbch4qihx2y9d6sv45bvd8kzrbd306";
    };
  };
  "gen" = {
    name = "gen";
    version = "v2.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-gen.git";
      rev = "v2.1.1";
      sha256 = "0pk68cn1s89hql30ydks9gh34gbxg391smi2albx3qvxnfkrpxca";
    };
  };
  "generics-rep" = {
    name = "generics-rep";
    version = "v6.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-generics-rep.git";
      rev = "v6.1.1";
      sha256 = "15vchzbcvf6byks90q14lvcwb8hnxqzm2mrlxi7v1f7has4s74kn";
    };
  };
  "globals" = {
    name = "globals";
    version = "v4.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-globals.git";
      rev = "v4.1.0";
      sha256 = "03h4npdbsjr1mkjasdi071l0cl7zdf3l76a8f0x4ghx47yvpgadn";
    };
  };
  "identity" = {
    name = "identity";
    version = "v4.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-identity.git";
      rev = "v4.1.0";
      sha256 = "1scdgbfkphfmapw7p9rnsiynpmqzyvnal2glzj450q51f8g1dhld";
    };
  };
  "integers" = {
    name = "integers";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-integers.git";
      rev = "v4.0.0";
      sha256 = "17d4bfpnrmbxlc7hhhrvnli70ydaqyr26zgvc9q52a76zgdcb4cf";
    };
  };
  "invariant" = {
    name = "invariant";
    version = "v4.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-invariant.git";
      rev = "v4.1.0";
      sha256 = "1fimpbh3yb7clvqxcdf4yf9im64z0v2s9pbspfacgq5b4vshjas9";
    };
  };
  "js-date" = {
    name = "js-date";
    version = "v6.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-contrib/purescript-js-date.git";
      rev = "v6.0.0";
      sha256 = "19qyzbr4a1ca8znbd8gcbz0a801f5p1v238ky3408gdx4ba32zjd";
    };
  };
  "js-timers" = {
    name = "js-timers";
    version = "v4.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-contrib/purescript-js-timers.git";
      rev = "v4.0.1";
      sha256 = "1a8092sli7zqw1wflibhjza1ww21dxl7x7r602iazzwh2g70v4dg";
    };
  };
  "lazy" = {
    name = "lazy";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-lazy.git";
      rev = "v4.0.0";
      sha256 = "156q89l4nvvn14imbhp6xvvm82q7kqh1pyndmldmnkhiqyr84vqv";
    };
  };
  "lcg" = {
    name = "lcg";
    version = "v2.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-lcg.git";
      rev = "v2.0.0";
      sha256 = "1851cq2g84jzjbvbmncbivbhaqzj9zv5ni3gs14k04nmx2brxmvj";
    };
  };
  "lists" = {
    name = "lists";
    version = "v5.4.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-lists.git";
      rev = "v5.4.1";
      sha256 = "0l0jiqhcjzkg4nv2a6h2vdf4izr9mf7cxc86cq1hf3j4dh6spym1";
    };
  };
  "makkori" = {
    name = "makkori";
    version = "v1.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/justinwoo/purescript-makkori.git";
      rev = "v1.0.0";
      sha256 = "09i5j2xqp6rjmljc6kbn3h1ybw1j3dfwdl6bxzr0wqk3y14wpdlq";
    };
  };
  "math" = {
    name = "math";
    version = "v2.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-math.git";
      rev = "v2.1.1";
      sha256 = "1msmy9w7y6fij62sdc55w68gpwkhm6lhgc8qjisjk4sxx1wdg1rr";
    };
  };
  "maybe" = {
    name = "maybe";
    version = "v4.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-maybe.git";
      rev = "v4.0.1";
      sha256 = "073wa0d51daxdwacfcxg5pf6ch63n4ii55xm1ih87bxrg8mp52mx";
    };
  };
  "media-types" = {
    name = "media-types";
    version = "v4.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-contrib/purescript-media-types.git";
      rev = "v4.0.1";
      sha256 = "0ykwmxrhmwfy6c5mxjxa43xdf5xqakrqyvr5fn986yad50gjqj75";
    };
  };
  "motsunabe" = {
    name = "motsunabe";
    version = "v2.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/justinwoo/purescript-motsunabe.git";
      rev = "v2.0.0";
      sha256 = "03r81xs0gw5nchm93ap2lpirkng8bzgsb8xc5jxlii4sw8wn8ndh";
    };
  };
  "naporitan" = {
    name = "naporitan";
    version = "v1.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/justinwoo/purescript-naporitan.git";
      rev = "v1.0.0";
      sha256 = "0d7krc91cda623ajarnwp5s1d35x4nr18y3095rz97yxw00lajzj";
    };
  };
  "newtype" = {
    name = "newtype";
    version = "v3.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-newtype.git";
      rev = "v3.0.0";
      sha256 = "0qvk9p41miy806b05b4ikbr3if0fcyc35gfrwd2mflcxxp46011c";
    };
  };
  "node-buffer" = {
    name = "node-buffer";
    version = "v6.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-node/purescript-node-buffer.git";
      rev = "v6.0.0";
      sha256 = "0pgl8r1rwzmbvwgbibk24jpgf6m7xcw3y7zfn6psgzca44c4hgsv";
    };
  };
  "node-http" = {
    name = "node-http";
    version = "v5.0.2";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-node/purescript-node-http.git";
      rev = "v5.0.2";
      sha256 = "0jr9mm0kdvkd3nf1g4l8w9p7n16qqji03fg1agxn7hngr4ja43pw";
    };
  };
  "node-streams" = {
    name = "node-streams";
    version = "v4.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-node/purescript-node-streams.git";
      rev = "v4.0.1";
      sha256 = "12dki2li0d7s54kvcr6gksb5nxf6kzs93gwxnq4bh1flri8p0i7r";
    };
  };
  "node-url" = {
    name = "node-url";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-node/purescript-node-url.git";
      rev = "v4.0.0";
      sha256 = "0qbpdz62psy7hb34hw5rw2x1pq7yhd214ysza0xh46c3nlp0ib9y";
    };
  };
  "nonempty" = {
    name = "nonempty";
    version = "v5.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-nonempty.git";
      rev = "v5.0.0";
      sha256 = "1vz174sg32cqrp52nwb2vz9frrzmdwzzlgl4vc2cm5wlf2anirxj";
    };
  };
  "now" = {
    name = "now";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-contrib/purescript-now.git";
      rev = "v4.0.0";
      sha256 = "18h5pif2dy4r7w1xg2zw4mvdqlar9xqp3rawkiavmsc946ncf3zs";
    };
  };
  "nullable" = {
    name = "nullable";
    version = "v4.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-contrib/purescript-nullable.git";
      rev = "v4.1.1";
      sha256 = "14qaxxga8gqlr4pijyvqycdyhjr6qpz3h4aarficw5j75b7x8nyv";
    };
  };
  "options" = {
    name = "options";
    version = "v5.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-contrib/purescript-options.git";
      rev = "v5.0.0";
      sha256 = "1n25pp0xsxfdxsnfdjjwlxz79iam9kapx4al9aj24yi148xhqckl";
    };
  };
  "ordered-collections" = {
    name = "ordered-collections";
    version = "v1.6.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-ordered-collections.git";
      rev = "v1.6.1";
      sha256 = "0r48p94d3cyzni2z7ikzcap472k23dx8zq37c1prmjb01v03mfvc";
    };
  };
  "orders" = {
    name = "orders";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-orders.git";
      rev = "v4.0.0";
      sha256 = "13p1sm4dxkmxhld9x5qqg62iiajjb3qpzs66c1r24y5fs4zsfry4";
    };
  };
  "parallel" = {
    name = "parallel";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-parallel.git";
      rev = "v4.0.0";
      sha256 = "1d5bnagabw2k8yxywkygwrpblb2ggqh2fhpqfrx2sj1y53x332hg";
    };
  };
  "partial" = {
    name = "partial";
    version = "v2.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-partial.git";
      rev = "v2.0.1";
      sha256 = "11qr80989g7xmvw1brnrclsbg2wdkbr5k3cqpngfip3nnirrypcn";
    };
  };
  "prelude" = {
    name = "prelude";
    version = "v4.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-prelude.git";
      rev = "v4.1.1";
      sha256 = "1frvjrv0mr508r6683l1mp5rzm1y2dz76fz40zf4k2c64sy6y1xm";
    };
  };
  "proxy" = {
    name = "proxy";
    version = "v3.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-proxy.git";
      rev = "v3.0.0";
      sha256 = "0rqf25b1n9p5sgx7gdsxwrfv9rb3sqxgqmqpp5kdm30lfk7snz24";
    };
  };
  "quickcheck" = {
    name = "quickcheck";
    version = "v6.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-quickcheck.git";
      rev = "v6.1.0";
      sha256 = "0b6208067krf81kzq2hbxs68386hcicbscwxbj5nck07ivjjvqh0";
    };
  };
  "random" = {
    name = "random";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-random.git";
      rev = "v4.0.0";
      sha256 = "0k37v7z529adx6ypxj0xjyfrz45qia6p0vki2wpvi8lik7c698gf";
    };
  };
  "react-basic" = {
    name = "react-basic";
    version = "v14.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/lumihq/purescript-react-basic.git";
      rev = "v14.0.0";
      sha256 = "1jsiqsy6g4abb2m7w0km60mw3qvc1740k95b5vdzd4q4vccl1pid";
    };
  };
  "record" = {
    name = "record";
    version = "v2.0.2";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-record.git";
      rev = "v2.0.2";
      sha256 = "0ap1mc7bi8a20c5g11lxif6q68s2sc31khirfabngr1jpsm3r4lw";
    };
  };
  "refs" = {
    name = "refs";
    version = "v4.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-refs.git";
      rev = "v4.1.0";
      sha256 = "08161iy1xbafzblv033v84156azpcqkiw9v9d6gliphrq5fm17gm";
    };
  };
  "simple-json" = {
    name = "simple-json";
    version = "v7.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/justinwoo/purescript-simple-json.git";
      rev = "v7.0.0";
      sha256 = "1x2f4zq1m9r3vg9hdpjld98jd56w7fss8fzvlrmnrw6xzd1gi456";
    };
  };
  "simple-json-utils" = {
    name = "simple-json-utils";
    version = "v0.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/justinwoo/purescript-simple-json-utils.git";
      rev = "v0.1.0";
      sha256 = "05mpvn3hrl86sapns88h7k9ccv29d8xmcnll8iz6ix5ibmh9vk2v";
    };
  };
  "st" = {
    name = "st";
    version = "v4.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-st.git";
      rev = "v4.1.1";
      sha256 = "1jpz8rpk2ac6kshflri8pdw4s1hf8g4alz5bw69x23sj9sccxgs0";
    };
  };
  "string-parsers" = {
    name = "string-parsers";
    version = "v5.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/paf31/purescript-string-parsers.git";
      rev = "v5.0.1";
      sha256 = "0qz9zry17hwvbhsbx25lj3g15yki22pdfz4slbqpv64mh6clb1iz";
    };
  };
  "strings" = {
    name = "strings";
    version = "v4.0.2";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-strings.git";
      rev = "v4.0.2";
      sha256 = "164mx0j9pv47m2hzckq51aa1rpb5wijcrh4bi78xn3s8n0fb6dq1";
    };
  };
  "tailrec" = {
    name = "tailrec";
    version = "v4.1.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-tailrec.git";
      rev = "v4.1.1";
      sha256 = "0n0sxr44d1lwlrgv8b48ml6vg0r5abfvyywn50jb0i1agnm53i4n";
    };
  };
  "test-unit" = {
    name = "test-unit";
    version = "v15.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/bodil/purescript-test-unit.git";
      rev = "v15.0.0";
      sha256 = "06lb90vppa7naqqwz7wbvlkkyz86pbdd3ycw3d2iygvxbzkz8xjn";
    };
  };
  "transformers" = {
    name = "transformers";
    version = "v4.2.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-transformers.git";
      rev = "v4.2.0";
      sha256 = "03qmvl9s7lbvm73dy9ps6qp39pdcm91hb8yakgj7aq8hgpj7b6bg";
    };
  };
  "tuples" = {
    name = "tuples";
    version = "v5.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-tuples.git";
      rev = "v5.1.0";
      sha256 = "045nsy0r2g51gih0wjhcvhl6gfr8947mlrqwg644ygz72rjm8wq4";
    };
  };
  "type-equality" = {
    name = "type-equality";
    version = "v3.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-type-equality.git";
      rev = "v3.0.0";
      sha256 = "1b7szyca5s96gaawvgwrw7fa8r7gqsdff7xhz3vvngnylv2scl3w";
    };
  };
  "typelevel-prelude" = {
    name = "typelevel-prelude";
    version = "v5.0.2";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-typelevel-prelude.git";
      rev = "v5.0.2";
      sha256 = "1kp1b35y8wzin9m5lfyp239nclq703xz2b4373x3075xfp6qdcwf";
    };
  };
  "unfoldable" = {
    name = "unfoldable";
    version = "v4.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-unfoldable.git";
      rev = "v4.1.0";
      sha256 = "03g2zz26ai8a44z07jhdj0yvv8q6nq6ifcrzc7qjmdkjywg2cj9v";
    };
  };
  "unsafe-coerce" = {
    name = "unsafe-coerce";
    version = "v4.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript/purescript-unsafe-coerce.git";
      rev = "v4.0.0";
      sha256 = "0k9255mk2mz6xjb11pwkgfcblmmyvr86ig5kr92jwy95xim09zip";
    };
  };
  "unsafe-reference" = {
    name = "unsafe-reference";
    version = "v3.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-contrib/purescript-unsafe-reference.git";
      rev = "v3.0.1";
      sha256 = "0q758dz59qz0li4s3w1qcg921xp5i5rh6i1l611iv7rr8cbj11al";
    };
  };
  "variant" = {
    name = "variant";
    version = "v6.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/natefaubion/purescript-variant.git";
      rev = "v6.0.1";
      sha256 = "0cn227q57zbqm6r1aw5kvnp1x8zkc1x7wx28yyz311lmy7k1mkql";
    };
  };
  "web-dom" = {
    name = "web-dom";
    version = "v4.0.2";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-web/purescript-web-dom.git";
      rev = "v4.0.2";
      sha256 = "0yyf4camcrq7h6b3mhlxk516fdmdni0bncz4kc4wppjds01la5ll";
    };
  };
  "web-events" = {
    name = "web-events";
    version = "v2.0.1";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-web/purescript-web-events.git";
      rev = "v2.0.1";
      sha256 = "1vd1gfh6zv50bq4v1ppl2wvc5mskcw9n1bfj29qjg0dx0ffxzv2f";
    };
  };
  "web-file" = {
    name = "web-file";
    version = "v2.3.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-web/purescript-web-file.git";
      rev = "v2.3.0";
      sha256 = "1pn3cp8kkvxlg0vx3m53i83n8c92agpxd7dj96ma3bnyskd17fxv";
    };
  };
  "web-html" = {
    name = "web-html";
    version = "v2.3.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-web/purescript-web-html.git";
      rev = "v2.3.0";
      sha256 = "1gz2wkph49rkwd7cm6j0mx9sv6a3nzxcidv50mrxydhl3h8153gy";
    };
  };
  "web-storage" = {
    name = "web-storage";
    version = "v3.0.0";
    src = pkgs.fetchgit {
      url = "https://github.com/purescript-web/purescript-web-storage.git";
      rev = "v3.0.0";
      sha256 = "1ycb2s29aw9w6lqik6hfmp9nf9i2yhn0q26hc4p3450jam5mj8bx";
    };
  };
}
