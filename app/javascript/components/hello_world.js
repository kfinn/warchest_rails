import h from "h";

export default function HelloWorld({ name }) {
  return h`<div>Hi, ${name}!</div>`;
}
