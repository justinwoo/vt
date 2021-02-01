const React = require("react");
const ReactDOM = require("react-dom");

exports.renderJSX = (jsx) => () =>
  ReactDOM.render(jsx, document.getElementById("app"));

exports.component_ = (name) => (effectFn1) => {
  effectFn1.displayName = name;
  return effectFn1;
};

exports.element = (tag) => (props) => (children) =>
  React.createElement(tag, props, children);

exports.useState_ = (tuple) => (initState) => () => {
  const [state, update] = React.useState(initState);
  return { state, update };
};

exports.useEffect = (keys) => (effect) => () => React.useEffect(effect, keys);
