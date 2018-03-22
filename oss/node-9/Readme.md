# Node 9

Node 9 application using a binary.

## Setup

```
$ yarn
```

## Deploy

```
$ up
```

## Notes

The `build` hook in `up.json` simply runs `make`, which queries `https://nodejs.org`
to determine the latest release, then pulls that down into your working
directory.

```json
{
  "hooks": {
    "build": "make"
  }
}
```

The `proxy.command` script is run inside Lambda to start your server. You can
think of this as `npm start`, however you'd likely want `npm start` to be
`node app.js` for local development. Defining `proxy.command` is strictly for
running in production.

```json
{
  "proxy": {
    "command": "./node-v9.8.0-linux-x64/bin/node app.js"
  }
}
```
