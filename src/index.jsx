import * as React from "react";
import * as ReactDOM from "react-dom";

const App = function () {
  const [xs, setXS] = React.useState(["hi"]);

  const rows = xs.map((x) => {
    return (
      <div className="row" key={x}>
        <div>Hi</div>
        <div>{x}</div>
      </div>
    );
  });

  return (
    <div>
      <h1>awfoeef</h1>
      <div className="rows">{rows}</div>
    </div>
  );
};

const appNode = document.getElementById("app");

ReactDOM.render(<App />, appNode);
