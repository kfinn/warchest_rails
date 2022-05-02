import "@hotwired/turbo-rails";
import ReactDom from "react-dom";
import HelloWorld from "components/hello_world";
import h from "h";

document.addEventListener('readystatechange', () => {
  const root = ReactDom.createRoot(document.getElementById('root'));
  root.render(h`<${HelloWorld} />`);
})
