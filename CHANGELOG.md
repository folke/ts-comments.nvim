# Changelog

## [1.5.0](https://github.com/folke/ts-comments.nvim/compare/v1.4.0...v1.5.0) (2024-07-23)


### Features

* **styled:** add styled-components support ([#50](https://github.com/folke/ts-comments.nvim/issues/50)) ([bd3841e](https://github.com/folke/ts-comments.nvim/commit/bd3841ef19dac0d3aa0240b6a825bcc1edc4bff0))

## [1.4.0](https://github.com/folke/ts-comments.nvim/compare/v1.3.0...v1.4.0) (2024-07-15)


### Features

* **kdl:** added kdl ([#44](https://github.com/folke/ts-comments.nvim/issues/44)) ([b7bccdb](https://github.com/folke/ts-comments.nvim/commit/b7bccdb5d17f92c42d03f2b157ff44fb7a3af888))

## [1.3.0](https://github.com/folke/ts-comments.nvim/compare/v1.2.0...v1.3.0) (2024-07-05)


### Features

* add basic Templ support ([#10](https://github.com/folke/ts-comments.nvim/issues/10)) ([1bbcef8](https://github.com/folke/ts-comments.nvim/commit/1bbcef8a7e0e0b0f75b10eecd427c3d973470649))
* added hyprlang ([e0c5d7a](https://github.com/folke/ts-comments.nvim/commit/e0c5d7a058645f90eed0e9a2b78fae58546e662e))
* **graphql:** add commentstring for graphql ([#30](https://github.com/folke/ts-comments.nvim/issues/30)) ([83bb13e](https://github.com/folke/ts-comments.nvim/commit/83bb13e23985b33e76b6245a1204487bcb581812))
* **notebook:** add commentstring for jupyter notebook files ([#34](https://github.com/folke/ts-comments.nvim/issues/34)) ([47a91de](https://github.com/folke/ts-comments.nvim/commit/47a91dea241579c82b93b004473f7a4586a90c12))
* **sql:** add sql commentstring ([#28](https://github.com/folke/ts-comments.nvim/issues/28)) ([596c671](https://github.com/folke/ts-comments.nvim/commit/596c671190fd944442c99368759e193738d12602))


### Bug Fixes

* remove Rust documentation comments ([#22](https://github.com/folke/ts-comments.nvim/issues/22)) ([cd9d011](https://github.com/folke/ts-comments.nvim/commit/cd9d011259e93a3f635725fe0bcb848da150f3ae))

## [1.2.0](https://github.com/folke/ts-comments.nvim/compare/v1.1.0...v1.2.0) (2024-05-26)


### Features

* add blueprint support ([#16](https://github.com/folke/ts-comments.nvim/issues/16)) ([5941b11](https://github.com/folke/ts-comments.nvim/commit/5941b11a6ce9f207c80798ba85f81ef03cbda84b))
* add CUE commentstring ([#8](https://github.com/folke/ts-comments.nvim/issues/8)) ([21061dd](https://github.com/folke/ts-comments.nvim/commit/21061dd0fc17e20ec640f856e7e84d607aef8a89))
* add golang support ([#11](https://github.com/folke/ts-comments.nvim/issues/11)) ([b49dc55](https://github.com/folke/ts-comments.nvim/commit/b49dc55f60b328e3a4ee3a1c4ed9f7cbe7c949a4))
* added csproj, fs, fsproj, ocaml, axaml, xaml, xml ([#18](https://github.com/folke/ts-comments.nvim/issues/18)) ([afbdb2e](https://github.com/folke/ts-comments.nvim/commit/afbdb2ef457f3f29f7f04c33569b984cf77534ff))
* added rust. Closes [#12](https://github.com/folke/ts-comments.nvim/issues/12) ([bab724b](https://github.com/folke/ts-comments.nvim/commit/bab724b27f9b54bd1791f2b6eb395f96cf5947d8))
* clojure language comment patterns ([#19](https://github.com/folke/ts-comments.nvim/issues/19)) ([1d5d975](https://github.com/folke/ts-comments.nvim/commit/1d5d975bea3eb4252cb04c62bf580041b51b3cd0))
* include vim.opt.comments for uncommmenting ([6f122f2](https://github.com/folke/ts-comments.nvim/commit/6f122f2d2bad57f5e6143c6ca2fb5e0d2151acef))


### Bug Fixes

* **config:** remove some langs that already resolve to defaults ([5131126](https://github.com/folke/ts-comments.nvim/commit/513112633fb0232a5439314f32704a40c78c5d30))
* jsx comment toggling ([#20](https://github.com/folke/ts-comments.nvim/issues/20)) ([1b4dc32](https://github.com/folke/ts-comments.nvim/commit/1b4dc325d00fef4725958f58c778108155765bb1))
* make sure we dont get commentstring from indent ([69321a2](https://github.com/folke/ts-comments.nvim/commit/69321a25797011359dabeade125450f6535af0a1))

## [1.1.0](https://github.com/folke/ts-comments.nvim/compare/v1.0.1...v1.1.0) (2024-05-21)


### Features

* Add csharp commentstring ([#5](https://github.com/folke/ts-comments.nvim/issues/5)) ([fe03b59](https://github.com/folke/ts-comments.nvim/commit/fe03b59c438e5cb4197357467a5d42adfe7fccb3))
* better uncommenting with whitespace fixes and multiple commmentstrings. Fixes [#4](https://github.com/folke/ts-comments.nvim/issues/4) ([97b7ad1](https://github.com/folke/ts-comments.nvim/commit/97b7ad17f737fe7f07ac6a3c918c279dc03347e6))
* **lang:** Add Ruby ([#6](https://github.com/folke/ts-comments.nvim/issues/6)) ([e7fab51](https://github.com/folke/ts-comments.nvim/commit/e7fab51a0b9251512919a71a6cf7423240baf1b8))

## [1.0.1](https://github.com/folke/ts-comments.nvim/compare/v1.0.0...v1.0.1) (2024-05-20)


### Bug Fixes

* dont error when treesitter parser is not available ([87fc61f](https://github.com/folke/ts-comments.nvim/commit/87fc61f065db61e3e229b08765e2ea030c0eaf61))

## 1.0.0 (2024-05-20)


### Features

* initial commit ([3783df5](https://github.com/folke/ts-comments.nvim/commit/3783df57058836a10d658f4c07eadf0237ed3846))
