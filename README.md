# into-docker/build-action

[![CI](https://github.com/into-docker/build-action/workflows/CI/badge.svg)](https://github.com/into-docker/build-action/actions?query=workflow%3ACI)
[![Release](https://img.shields.io/github/v/release/into-docker/build-action?include_prereleases&sort=semver)](https://github.com/into-docker/build-action/releases/latest)
[![Spice Program](https://img.shields.io/badge/spice_program-sponsored-brightgreen.svg?logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAA4AAAAPCAMAAADjyg5GAAABqlBMVEUAAAAzmTM3pEn%2FSTGhVSY4ZD43STdOXk5lSGAyhz41iz8xkz2HUCWFFhTFFRUzZDvbIB00Zzoyfj9zlHY0ZzmMfY0ydT0zjj92l3qjeR3dNSkoZp4ykEAzjT8ylUBlgj0yiT0ymECkwKjWqAyjuqcghpUykD%2BUQCKoQyAHb%2BgylkAyl0EynkEzmkA0mUA3mj86oUg7oUo8n0k%2FS%2Bw%2Fo0xBnE5BpU9Br0ZKo1ZLmFZOjEhesGljuzllqW50tH14aS14qm17mX9%2Bx4GAgUCEx02JySqOvpSXvI%2BYvp2orqmpzeGrQh%2Bsr6yssa2ttK6v0bKxMBy01bm4zLu5yry7yb29x77BzMPCxsLEzMXFxsXGx8fI3PLJ08vKysrKy8rL2s3MzczOH8LR0dHW19bX19fZ2dna2trc3Nzd3d3d3t3f39%2FgtZTg4ODi4uLj4%2BPlGxLl5eXm5ubnRzPn5%2Bfo6Ojp6enqfmzq6urr6%2Bvt7e3t7u3uDwvugwbu7u7v6Obv8fDz8%2FP09PT2igP29vb4%2BPj6y376%2Bu%2F7%2Bfv9%2Ff39%2Fv3%2BkAH%2FAwf%2FtwD%2F9wCyh1KfAAAAKXRSTlMABQ4VGykqLjVCTVNgdXuHj5Kaq62vt77ExNPX2%2Bju8vX6%2Bvr7%2FP7%2B%2FiiUMfUAAADTSURBVAjXBcFRTsIwHAfgX%2FtvOyjdYDUsRkFjTIwkPvjiOTyX9%2FAIJt7BF570BopEdHOOstHS%2BX0s439RGwnfuB5gSFOZAgDqjQOBivtGkCc7j%2B2e8XNzefWSu%2BsZUD1QfoTq0y6mZsUSvIkRoGYnHu6Yc63pDCjiSNE2kYLdCUAWVmK4zsxzO%2BQQFxNs5b479NHXopkbWX9U3PAwWAVSY%2FpZf1udQ7rfUpQ1CzurDPpwo16Ff2cMWjuFHX9qCV0Y0Ok4Jvh63IABUNnktl%2B6sgP%2BARIxSrT%2FMhLlAAAAAElFTkSuQmCC)](https://spiceprogram.org)

This is a [Github Action][gha] to run Docker builds using the [into-docker][]
CLI tool.

## Usage

**Build**

```yaml
- uses: into-docker/build-action@v2
  with:
    image: target-image:latest
    builder: intodocker/clojure

# optional: push to docker registry
- run: >
    echo ${{ secrets.DOCKER_PASSWORD }} | \
      docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin && \
      docker push target-image:latest
```

**Build + Caching**

```yaml
- uses: actions/cache@v2
  with:
    path: cache-file.tar
    key: ${{ runner.os }}-${{ hashFiles('project.clj') }}

- uses: into-docker/build-action@v2
  with:
    image: target-image:latest
    builder: intodocker/clojure
    cache-path: cache-file.tar
# ...
```

**Build + Environment Variables**

Make sure that you're providing a `.buildenv` file as outlined [here][buildenv].
Afterwards, you can use the usual Github Actions `env` clause to supply them.

```yaml
- uses: into-docker/build-action@v2
  with:
    image: target-image:latest
    builder: intodocker/clojure
  env:
    SECRET_USERNAME: ...
    SECRET_TOKEN: ...
```

[buildenv]: https://github.com/into-docker/into-docker#secrets-experimental

## Inputs

| Name             | Required | Description                                                     |
| :--------------- | :------: | :-------------------------------------------------------------- |
| `builder`        |   Yes    | The [into-docker][] builder image to use.                       |
| `image`          |   Yes    | The target image that should be created (`name:tag`)            |
| `source-path`    |    No    | Path, relative to the project root, to use as build source      |
| `artifacts-path` |    No    | Path, relative to the project root, to write build artifacts to |
| `cache-path`     |    No    | Path to a cache archive that should be used/created             |
| `profile`        |    No    | Build profile (provided by the builder image) to use            |
| `version`        |    No    | Specific version of the CLI tool to use                         |

## Outputs

None.

## Development

We use [prettier][] to ensure consistent formatting of Markdown and YAML files.
Please run `yarn` or `npm install` to register the pre-commit hook.

[gha]: https://help.github.com/en/actions
[into-docker]: https://github.com/into-docker/into-docker
[prettier]: https://prettier.io/

## License

```
MIT License

Copyright (c) 2020 Yannick Scherer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
