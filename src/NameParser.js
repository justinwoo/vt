exports.parseTitle_ = (nothing) => (just) => (input) => {
  let regex = /\[.*\] (.+) - ([\d]+)[v\d]* \(.*\) \[.*\]\.[\w]*/;
  let matches = input.match(regex);
  if (!matches || matches.length != 3) {
    return nothing;
  } else {
    return just({
      name: matches[1],
      episode: parseInt(matches[2]),
    });
  }
};
