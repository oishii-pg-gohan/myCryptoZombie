# myCryptoZombie  

## ひとまず、web3いじる辺りまでTutorialは完了。
https://share.cryptozombies.io/jp/lesson/6/share/The_Phantom_of_Web3?id=Y3p8MTIzODk3  

## 概要
Ethereumのスマートコントラクト、Solidity学習サイトのTutorialソースコード  
https://cryptozombies.io/jp/  

TRUFFLE環境で実施。  
https://www.trufflesuite.com/  
※ひとまずCourse2-Chapter8の時点ではブロックチェーンへのアクセスは利用していないため、  
　truffle-config.jsファイルは無視してok。  
　TRUFFLEはcompile等のコマンドのために利用。（いずれGanacheやGethと連携する時にはtruffle-config.jsが必要になってくる）  

# VSCode
## Plugin
solidityというプラグインをインストール。  
![vscode_solidity_plugin](https://user-images.githubusercontent.com/65577678/129174843-bec5ddf6-5c29-4b34-8aba-70ffd39b783e.png)

## settings
compilerを0.5.16に設定する。  
CryptoZombieで利用しているSolidityのバージョンは0.4.19だが、  
VSCodeのプラグインsolidityでは0.5.x以降でないと怒られる。  
Solidityの最新は0.8.xみたいだが、CryptoZombieでの書き方と  
まぁまぁ差がありそうなので、近いバージョンを指定している。
![vscodeで動かすときのcompiler指定](https://user-images.githubusercontent.com/65577678/129219499-de85ecaf-8f3a-4ba2-85c3-eff2d346a6fd.png)
