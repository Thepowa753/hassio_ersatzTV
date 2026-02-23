# hassio_ersatzTV

Home Assistant add-on for [ErsatzTV](https://github.com/ErsatzTV/ErsatzTV) – virtual TV channel assembly and streaming.

## ⚠️ Disclaimer

**The ErsatzTV application and all its source code belong to their respective authors and contributors.**
This repository only provides a Home Assistant add-on wrapper around the official ErsatzTV Docker image (`ghcr.io/ersatztv/ersatztv:latest`).
I am not affiliated with the ErsatzTV project and take no credit for the underlying software.

## Installation

1. Open Home Assistant and go to **Settings → Add-ons → Add-on Store**.
2. Click the three-dot menu in the top-right corner and select **Repositories**.
3. Add the URL of this repository: `https://github.com/Thepowa753/hassio_ersatzTV`
4. Find **ErsatzTV** in the add-on store and click **Install**.

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `base_folder` | `/media` | Base folder for ErsatzTV media library (mapped to the HA `/media` share by default). |

### Port mapping

ErsatzTV listens on port **8409** inside the container. You can change the **host-side** port binding in the add-on's **Network** configuration panel in Home Assistant without affecting ingress.

## Sidebar tab

The add-on registers itself as a panel in the Home Assistant left sidebar via the built-in ingress feature, so you can access the ErsatzTV UI directly from HA.

## Links

- [ErsatzTV GitHub](https://github.com/ErsatzTV/ErsatzTV)
- [ErsatzTV Docker Hub](https://github.com/ErsatzTV/ErsatzTV/pkgs/container/ersatztv)
