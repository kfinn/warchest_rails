import "@hotwired/turbo-rails";
import ReactDom from "react-dom";
import h from "h";
import _ from 'lodash';
import * as components from 'components';

document.addEventListener('readystatechange', (event) => {
  if (event.isTrusted && event.target.readyState === 'complete') {
    document.querySelectorAll('[data-react-component]').forEach((element) => {
      console.log(element)
      const root = ReactDom.createRoot(element);
      const data = JSON.parse(element.getAttribute('data-react-component'));
      console.log(data);
      const { name, props } = data;
      root.render(h`<${_.get(components, name)} ...${props} />`)
    })
  }
})
