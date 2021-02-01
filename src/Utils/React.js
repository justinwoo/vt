const React = require("react");
const ReactDOM = require("react-dom");

exports.renderJSX = (jsx) => () =>
  ReactDOM.render(jsx, document.getElementById("app"));

exports.component = (name) => (effect) => {
  const myComponent = (props) => effect(props)();
  myComponent.displayName = name;
  return myComponent;
};

exports.element = (tag) => (props) => (children) =>
  React.createElement(tag, props, children);

exports.useState_ = (tuple) => (initState) => () => {
  const [state, update] = React.useState(initState);
  const updater = (fn) => {
    update((s) => {
      const newState = fn(s)();
      return newState;
    });
  };
  return tuple(state, updater);
};

exports.useEffect = (keys) => (effect) => () => {
  React.useEffect(() => {
    const canceler = effect();
    return canceler;
  }, keys);
};
