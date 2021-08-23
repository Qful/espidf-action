# ESP-IDF v4.x installer

GitHub Action to install Espressif IoT Development Framework v4.x for building ESP32 code.

**Note:** [ESP-IDF v4.x build](https://github.com/marketplace/actions/esp-idf-v4-x-build) is faster to use as a GitHub Action for
building ESP32 code. It uses Espressif's official Docker container skipping the whole installation part.

The usable ESP-IDF versions are:

- `latest` (based on release/v4.2)
- `v4.2`, v4.2.x, `release/v4.2`
- `v4.1`, v4.1.x, `release/v4.1`
- v4.0.x, `release/v4.0`

**Note:** The action is built for Ubuntu 20.04 LTS. It may or may not work with other Ubuntu or Debian versions.

## Usage

Source the ESP-IDF required environment variables before building your code:

```sh
source ~/esp/esp-idf/export.sh
idf.py build
```

It is used at least in [ESP32HAL](https://github.com/CalinRadoni/ESP32HAL) repository.

### Example

```yml
name: ESP32 Builder

on: [push]

jobs:
  builder:
    name: Builder for test ESP32 project
    runs-on: ubuntu-20.04

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Install ESP-IDF
        uses: CalinRadoni/esp-idf-v4-action@v2
        with:
          esp_idf_version: 'v4.1'

      - name: Build
        run: |
          source ~/esp/esp-idf/export.sh
          idf.py reconfigure
          idf.py app
          idf.py size
```

