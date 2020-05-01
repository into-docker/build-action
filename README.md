# into-docker/build-action

[![CI](https://github.com/into-docker/build-action/workflows/CI/badge.svg)](https://github.com/into-docker/build-action/actions?query=workflow%3ACI)

This is a [Github Action][gha] to run Docker builds using the [into-docker][]
CLI tool.

## Usage

```yaml
- uses: into-docker/build-action@v1
  with:
    image: target-image:latest
    builder: intodocker/clojure
    profile: default
    cache: cache-file.tar

# optional: push to docker registry
- run: >
    echo ${{ secrets.DOCKER_PASSWORD }} | \
      docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin && \
      docker push target-image:latest
```

## Inputs

| Name      | Required | Description                                                |
| :-------- | :------: | :--------------------------------------------------------- |
| `builder` |   Yes    | The [into-docker][] builder image to use.                  |
| `image`   |   Yes    | The target image that should be created (`name:tag`)       |
| `path`    |    No    | Path, relative to the project root, to use as build source |
| `cache`   |    No    | Path to a cache archive that should be used/created        |
| `profile` |    No    | Build profile (provided by the builder image) to use       |
| `version` |    No    | Specific version of the CLI tool to use                    |

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
