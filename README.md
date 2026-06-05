# rock8cloud-vue-blueprint

This template should help get you started developing with Vue 3 in Vite. It is based on the official scaffold from the [Vue.js Quick Start guide](https://vuejs.org/guide/quick-start.html) (created with `create-vue`), extended with a `Dockerfile` so it can be deployed on [Rock8Cloud](https://rock8.cloud/).

## Recommended IDE Setup

[VS Code](https://code.visualstudio.com/) + [Vue (Official)](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

## Recommended Browser Setup

- Chromium-based browsers (Chrome, Edge, Brave, etc.):
  - [Vue.js devtools](https://chromewebstore.google.com/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd)
  - [Turn on Custom Object Formatter in Chrome DevTools](http://bit.ly/object-formatters)
- Firefox:
  - [Vue.js devtools](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)
  - [Turn on Custom Object Formatter in Firefox DevTools](https://fxdx.dev/firefox-devtools-custom-object-formatters/)

## Type Support for `.vue` Imports in TS

TypeScript cannot handle type information for `.vue` imports by default, so we replace the `tsc` CLI with `vue-tsc` for type checking. In editors, we need [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) to make the TypeScript language service aware of `.vue` types.

## Customize configuration

See [Vite Configuration Reference](https://vite.dev/config/).

## Project Setup

```sh
bun install
```

### Compile and Hot-Reload for Development

```sh
bun dev
```

### Type-Check, Compile and Minify for Production

```sh
bun run build
```

### Lint with [ESLint](https://eslint.org/)

```sh
bun lint
```

## Deploy on [Rock8Cloud](https://rock8.cloud/)

This blueprint ships with a multi-stage `Dockerfile` (Node build → nginx serving the static `dist/` with SPA fallback for vue-router), so it can run on [Rock8Cloud](https://rock8.cloud/)'s Docker-based deployment out of the box.

1. Push this repository to GitHub.
2. Sign in at [app.rock8.cloud](https://app.rock8.cloud) and connect the repository.
3. Rock8Cloud picks up the `Dockerfile`, builds the image, and deploys it — the container serves the app on port `80`.
4. From then on, every push to `main` deploys automatically, and each pull request gets its own preview URL.

You can verify the container locally before deploying:

```sh
docker build -t rock8cloud-vue-blueprint .
docker run -p 8080:80 rock8cloud-vue-blueprint
# open http://localhost:8080
```

See the [Rock8Cloud documentation](https://customer-docs.rock8cloud.cz/) for more details.
