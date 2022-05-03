import "@hotwired/turbo-rails";
import * as components from "components";
import h from "h";
import _ from "lodash";
import ReactDom from "react-dom";

function handleLoad() {
  document.querySelectorAll("[data-react-component]").forEach((element) => {
    const root = ReactDom.createRoot(element);
    const data = JSON.parse(element.getAttribute("data-react-component"));
    const { name, props } = data;
    root.render(h`<${_.get(components, name)} ...${props} />`);
  });
}

document.addEventListener("turbo:load", handleLoad);

window.process = { env: { NODE_ENV: "production" } };
