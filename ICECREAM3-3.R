##各アイスはどの要素で高評価を得ているのか編


##星4.0以上のレビューを抽出
haagenDF_high = haagenDF2[haagenDF2[,1]>=4.0,]
soDF_high = soDF2[soDF2[,1]>=4.0,]
mowDF_high = mowDF2[mowDF2[,1]>=4.0,]
bokujoDF_high = bokujoDF2[bokujoDF2[,1]>=4.0,]
supercupDF_high = supercupDF2[supercupDF2[,1]>=4.0,]


##各ブランドの高評価レビューをCSV化→単語の出現頻度調査
write.csv(haagenDF_high, file = "haagenDF_high.csv")
haagenHIGH_freq = RMeCabFreq("haagenDF_high.csv")

write.csv(soDF_high, file = "soDF_high.csv")
soHIGH_freq = RMeCabFreq("soDF_high.csv")

write.csv(mowDF_high, file = "mowDF_high.csv")
mowHIGH_freq = RMeCabFreq("mowDF_high.csv")

write.csv(bokujoDF_high, file = "bokujoDF_high.csv")
bokujoHIGH_freq = RMeCabFreq("bokujoDF_high.csv")

write.csv(supercupDF_high, file = "supercupDF_high.csv")
supercupHIGH_freq = RMeCabFreq("supercupDF_high.csv")


##3-2で判明した12観点に絞る
haagenHIGH_freq2 = subset(haagenHIGH_freq, Term %in% c("味","濃厚","甘い","ミルク","ボリューム","量","味わい","後味","値段","コク","なめらか","氷"))
soHIGH_freq2 = subset(soHIGH_freq, Term %in% c("味","濃厚","甘い","ミルク","ボリューム","量","味わい","後味","値段","コク","なめらか","氷"))
mowHIGH_freq2 = subset(mowHIGH_freq, Term %in% c("味","濃厚","甘い","ミルク","ボリューム","量","味わい","後味","値段","コク","なめらか","氷"))
bokujoHIGH_freq2 = subset(bokujoHIGH_freq, Term %in% c("味","濃厚","甘い","ミルク","ボリューム","量","味わい","後味","値段","コク","なめらか","氷"))
supercupHIGH_freq2 = subset(supercupHIGH_freq, Term %in% c("味","濃厚","甘い","ミルク","ボリューム","量","味わい","後味","値段","コク","なめらか","氷"))


##加工(品詞と活用の削除→転置して横長に→データフレーム化→不足列の追加→並べ替えて統一→行列化)
haagenHIGH_freq3 = haagenHIGH_freq2[,-(2:3)]
haagen_index = t(haagenHIGH_freq3)
haagen_index2 = as.data.frame(haagen_index)
haagen_index3 = transform(haagen_index2,EX = c("ボリューム",0))
haagen_index4 = haagen_index3[,c(1,2,14,3,4,5,6,7,8,9,10,11,12,13)]
haagen_index5 = as.matrix(haagen_index4)

soHIGH_freq3 = soHIGH_freq2[,-(2:3)]
so_index = t(soHIGH_freq3)
so_index2 = as.data.frame(so_index)
so_index5 = as.matrix(so_index2)


mowHIGH_freq3 = mowHIGH_freq2[,-(2:3)]
mow_index = t(mowHIGH_freq3)
mow_index2 = as.data.frame(mow_index)
mow_index3 = transform(mow_index2,EX = c("氷",0))
mow_index4 = mow_index3[,c(1,2,3,4,5,6,14,7,8,9,10,11,12,13)]
mow_index5 = as.matrix(mow_index4)

bokujoHIGH_freq3 = bokujoHIGH_freq2[,-(2:3)]
bokujo_index = t(bokujoHIGH_freq3)
bokujo_index2 = as.data.frame(bokujo_index)
bokujo_index3 = transform(bokujo_index2,EX = c("氷",0),EX2 = c("量",0))
bokujo_index4 = bokujo_index3[,c(1,2,3,4,5,6,13,7,8,9,10,11,12,14)]
bokujo_index5 = as.matrix(bokujo_index4)

supercupHIGH_freq3 = supercupHIGH_freq2[,-(2:3)]
supercup_index = t(supercupHIGH_freq3)
supercup_index2 = as.data.frame(supercup_index)
supercup_index3 = transform(supercup_index2,EX = c("氷",0))
supercup_index4 = supercup_index3[,c(1,2,3,4,5,6,14,7,8,9,10,11,12,13)]
supercup_index5 = as.matrix(supercup_index4)


##5ブランド×12観点の行列の作成
all_index =rbind(haagen_index5,so_index5,mow_index5,bokujo_index5,supercup_index5)
all_index2 = all_index[c(2,4,6,8,10),]
all_index2[1,8] = 90
all_index2[2,8] = 76
all_index2[3,8] = 129
all_index2[4,8] = 45
all_index2[5,8] = 78
all_index2[1,10] = 7
all_index2[2,10] = 17
all_index2[3,10] = 34
all_index2[4,10] = 9
all_index2[5,10] = 60
all_index3 = all_index2[,-c(13,14)]
all_index4 = as.data.frame(all_index3,row.names = c("ハーゲンダッツ","爽","MOW","牧場しぼり","スーパーカップ"))
colnames(all_index4) = c("甘い","コク","ボリューム","ミルク","後味","値段","氷","味","味わい","量","なめらか","濃厚")
all_index5 = as.matrix(all_index4)
all_index6 = as.numeric(all_index5)
all_index7 = matrix(all_index6,ncol = 12,nrow = 5)
rownames(all_index7) =  c("ハーゲンダッツ","爽","MOW","牧場しぼり","スーパーカップ")
colnames(all_index7) =  c("甘い","コク","ボリューム","ミルク","後味","値段","氷","味","味わい","量","なめらか","濃厚")


## 単語を出現回数ではなく出現確率にして標準化（ブランドによるサンプルサイズの違いを考慮）
for (i in 1:12) {
  all_index7[1,i] = all_index7[1,i]*100/(sum(haagenHIGH_freq[,4]))
}

for (i in 1:12) {
  all_index7[2,i] = all_index7[2,i]*100/(sum(soHIGH_freq[,4]))
}

for (i in 1:12) {
  all_index7[3,i] = all_index7[3,i]*100/(sum(mowHIGH_freq[,4]))
}

for (i in 1:12) {
  all_index7[4,i] = all_index7[4,i]*100/(sum(bokujoHIGH_freq[,4]))
}

for (i in 1:12) {
  all_index7[5,i] = all_index7[5,i]*100/(sum(supercupHIGH_freq[,4]))
}

all_index8 = round(all_index7,digits = 3)


##主成分分析
pca.1 = prcomp(all_index8,scale. = F)
summary(pca.1)
biplot(x=pca.1)
