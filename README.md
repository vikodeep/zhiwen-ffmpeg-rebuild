# 知闻 FFmpeg 源码重建实验

这是文件工具箱的视频引擎构建实验，不是工具箱网站，也不自动发布二进制。
本仓库基于 [ffmpeg.wasm v12.15](https://github.com/ffmpegwasm/ffmpeg.wasm/tree/v12.15)。
源码清单固定了候选依赖版本；这些版本用于新构建，不表示已证明它们生成了 npm 的原始二进制。

上游 ffmpeg.wasm 的自有代码使用根目录的 MIT 许可证。仓库中
`src/fftools` 的 FFmpeg 源码包含独立的版权与 LGPL 许可证声明，请以各文件的
许可证头为准；对应的 LGPL 和 GPL 许可文本位于 `licenses/`。构建配方启用了
GPL 组件，产物及完整对应源码、依赖和通知仍需单独审查。

本项目尚未确认完整源码分发材料，不应将实验产物接入或发布到文件工具箱。
详细限制与操作见 [README-REBUILD.md](README-REBUILD.md)。
