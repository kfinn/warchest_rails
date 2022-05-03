import "@hotwired/turbo-rails";
import ReactDom from "react-dom";
import h from "h";
import _ from 'lodash';
import * as components from 'components';

document.addEventListener('readystatechange', (event) => {
  if (event.isTrusted && event.target.readyState === 'complete') {
    document.querySelectorAll('[data-react-component]').forEach((element) => {
      const root = ReactDom.createRoot(element);
      const data = JSON.parse(element.getAttribute('data-react-component'));
      const { name, props } = data;
      root.render(h`<${_.get(components, name)} ...${props} />`)
    })
  }
})

window.process = { env: { NODE_ENV: 'production' } }
