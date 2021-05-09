# <img src="https://rawcdn.githack.com/sitiom/chocolatey-packages/main/icons/gifski.png" alt="icon" width="48" height="48"/> [![chocolatey](https://img.shields.io/chocolatey/v/gifski.svg?color=red&label=gifski)](https://chocolatey.org/packages/gifski)

Highest-quality GIF encoder based on [pngquant](https://pngquant.org).

**[gifski](https://gif.ski)** converts video frames to GIF animations using pngquant's fancy features for efficient cross-frame palettes and temporal dithering. It produces animated GIFs that use thousands of colors per frame.

## Usage

gifski is a command-line tool. There is no GUI for Windows or Linux (there is one for [macOS](https://sindresorhus.com/gifski)).

The recommended way is to first export video as PNG frames. If you have `ffmpeg` installed, you can run in terminal:

```sh
ffmpeg -i video.webm frame%04d.png
```

and then make the GIF from the frames:

```sh
gifski -o anim.gif frame*.png
```

You can also resize frames (with `-W <width in pixels>` option). If the input was ever encoded using a lossy video codec it's recommended to at least halve size of the frames to hide compression artefacts and counter chroma subsampling that was done by the video codec.

Adding `--quality=90` may reduce file sizes a bit, but expect to lose a lot of quality for little gain. GIF just isn't that good at compressing, no matter how much you compromise.

See `gifski -h` for more options.