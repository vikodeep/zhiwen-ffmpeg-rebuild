# Experimental source-locked FFmpeg.wasm rebuild

This is preparation for a new build, based on upstream ffmpegwasm/ffmpeg.wasm
v12.15 (71aa99d37c02a7b4c435275ca9ef50e612f6efa1). The locked dependency
commits are candidates for a **new** build, not a claim that they produced the
original npm binary. Do not publish or replace the toolbox engine until the
build, browser functionality, complete corresponding source and all license
notices have been reviewed.

The source snapshot script requires Git, GNU tar and network access. Run it only
in a disposable Linux build environment with RUNNER_TEMP set. The upstream
Makefile's production target requires Docker Buildx. The image digest and
dependency sources must be preserved together with build commands and notices.
Emscripten's SDL2 port, its SDL source archive, toolchain provenance, recursive
submodules and other port dependencies require additional review; the locked
list alone is not a complete corresponding-source package.
