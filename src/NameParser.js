exports.parseTitle_ = (nothing) => (just) => (input) => {
  let regex = /\[.*\] (.+) - ([\d]+)[v\d]* \(.*\) \[.*\]\.[\w]*/;
  let old_regex = /\[.*\] (.+) - (\d+) (?:\[.*\])*.mkv/;
  let matches = input.match(regex);
  let old_matches = input.match(old_regex);
  if (matches && matches.length === 3) {
    return just({
      name: matches[1],
      episode: parseInt(matches[2]),
    });
  } else if (old_matches && old_matches.length === 3) {
    return just({
      name: old_matches[1],
      episode: parseInt(old_matches[2]),
    });
  } else {
    return nothing;
  }
};
