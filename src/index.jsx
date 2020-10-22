import * as React from "react";
import * as ReactDOM from "react-dom";

const files = [
  {
    name: "[Yes] Thing 123 123 123 123 - 01 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
  {
    name: "[Yes] Thing 123 123 123 123 - 02 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
  {
    name: "[Yes] Thing 123 123 123 123 - 03 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
  {
    name: "[Yes] Thing 123 123 123 123 - 04 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
  {
    name: "[Yes] Thing 123 123 123 123 - 123012390 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
  {
    name: "[Yes] Thing 123 123 123 123 - 12309123 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
  {
    name: "[Yes] Thing 123 123 123 123 - 123123 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
  {
    name: "[Yes] Thing 123 123 123 123 - 1324123 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
  {
    name: "[Yes] Thing 123 123 123 123 - 123 [720p].mkv",
    watched: `watched ${new Date().toDateString()}`,
  },
];

const groups = [
  { files, title: "group 1" },
  { files, title: "group 2" },
  { files, title: "group 3" },
];

const File = function (props) {
  return (
    <div className="file" key={props.name}>
      <div className="name">{props.name}</div>
      <div className="watched">{props.watched}</div>
    </div>
  );
};

const Group = function (props) {
  return (
    <div className="group" key={props.title}>
      <div className="icon"></div>
      <div className="content">
        <h2>{props.title}</h2>
        <div className="files">{props.files.map(File)}</div>
      </div>
    </div>
  );
};

const App = function () {
  const [xs, setXS] = React.useState(groups);

  return (
    <div>
      <h1>awfoeef</h1>
      <div className="groups">{xs.map(Group)}</div>
    </div>
  );
};

const appNode = document.getElementById("app");

ReactDOM.render(<App />, appNode);
