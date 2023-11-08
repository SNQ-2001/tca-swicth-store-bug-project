# tca-swicth-store-bug-project

## 警告文
```
UIKit Internal bug: Unbalanced call to _endOcclusion, please file a feedback report with any information you have that helps reproduce this bug!
```
![スクリーンショット 2023-11-08 10 32 58](https://github.com/SNQ-2001/tca-swicth-store-bug-project/assets/84154073/a8d7d977-9050-4dd2-917c-a8052030d457)

## 詳細
どちらかを削除しないと`SwitchStore`の切り替え時にバグる
- `HomeView`の`TabView`
- `Presentation1View`の`NavigationStack`

`TabView`の中に`NavigationStack`がはいってることでバグが起きてる気がする

## バグ動画
`SwitchStore`で切り替えると閉じたはずのシートが表示されてしまう
|正常|バグ|
|-|-|
|<video src="https://github.com/SNQ-2001/tca-swicth-store-bug-project/assets/84154073/984b1ab1-e145-48c5-8834-7a2e929a48ee" width="50%"></video>|<video src="https://github.com/SNQ-2001/tca-swicth-store-bug-project/assets/84154073/c5a12b40-9793-46d8-85ac-613c0b0eb8cd" width="50%"></video>|

## 解決策求む！！
`TabView`も`NavigationStack`も使いたいのでUIは変えずにこの問題を解決したい
