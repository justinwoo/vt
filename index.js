// start up frontend main
function main() {
  require("./output/FrontEnd").main();
}

main();

// Note that a dynamic `import` statement here is required due to
// webpack/webpack#6615, but in theory `import { greet } from './pkg';`
// will work here one day as well!
window.console_log = function(string) {
  console.log(string);
};

const rust = import("./wasm/pkg");

rust
  .then(m => {
    window.wasm = m;
  })
  .catch(console.error);
