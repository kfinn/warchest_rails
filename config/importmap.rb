# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "h", preload: true
pin "api"
pin_all_from "app/javascript/components", under: "components"

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin "htm", to: "https://ga.jspm.io/npm:htm@3.1.1/dist/htm.module.js"
pin "react", to: "https://ga.jspm.io/npm:react@18.1.0/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@18.1.0/index.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/process-production.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.22.0/index.js"
pin "lodash", to: "https://ga.jspm.io/npm:lodash@4.17.21/lodash.js"
pin "axios", to: "https://ga.jspm.io/npm:axios@0.27.2/index.js"
pin "#lib/adapters/http.js", to: "https://ga.jspm.io/npm:axios@0.27.2/lib/adapters/xhr.js"
pin "#lib/defaults/env/FormData.js", to: "https://ga.jspm.io/npm:axios@0.27.2/lib/helpers/null.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.24/nodelibs/browser/buffer.js"
pin "camelize", to: "https://ga.jspm.io/npm:camelize@1.0.0/index.js"
pin "snakeize", to: "https://ga.jspm.io/npm:snakeize@0.1.0/index.js"
pin "react-query", to: "https://ga.jspm.io/npm:react-query@3.38.1/es/index.js"
pin "@babel/runtime/helpers/esm/extends", to: "https://ga.jspm.io/npm:@babel/runtime@7.17.9/helpers/esm/extends.js"
pin "@babel/runtime/helpers/esm/inheritsLoose", to: "https://ga.jspm.io/npm:@babel/runtime@7.17.9/helpers/esm/inheritsLoose.js"
pin "@react-hook/event", to: "https://ga.jspm.io/npm:@react-hook/event@1.2.6/dist/module/index.js"
