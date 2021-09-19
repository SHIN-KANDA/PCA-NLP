##アイスの銘柄別では何の単語が多いのか編

##CSV化と出現頻度
write.csv(haagenDF, file = "haagen.csv")
haagen_freq = RMeCabFreq("haagen.csv")

write.csv(soDF, file = "so.csv")
so_freq = RMeCabFreq("so.csv")

write.csv(mowDF, file = "mow.csv")
mow_freq = RMeCabFreq("mow.csv")

write.csv(bokujoDF, file = "bokujo.csv")
bokujo_freq = RMeCabFreq("bokujo.csv")

write.csv(supercupDF, file = "supercup.csv")
supercup_freq = RMeCabFreq("supercup.csv")



##各アイスについて使える形容詞と名詞だけ抽出&多い順にソート
haagen_F2 = subset(haagen_freq, Info1 %in% c("形容詞","名詞"))
haagen_F3 = subset(haagen_F2, !Info2 %in% c("接尾","非自立","代名詞"))
haagen_F4 = haagen_F3[order(haagen_F3$Freq,decreasing = T),]
haagen_F4 %>% head()
haagen_F5 = haagen_F4[-c(1:2,4,7,10,11,16,30,31),]

so_F2 = subset(so_freq, Info1 %in% c("形容詞","名詞"))
so_F3 = subset(so_F2, !Info2 %in% c("接尾","非自立","代名詞"))
so_F4 = so_F3[order(so_F3$Freq,decreasing = T),]
so_F4 %>% head()
so_F5 = so_F4[-c(1,2,4,6,10,16,19:21,25),]

mow_F2 = subset(mow_freq, Info1 %in% c("形容詞","名詞"))
mow_F3 = subset(mow_F2, !Info2 %in% c("接尾","非自立","代名詞"))
mow_F4 = mow_F3[order(mow_F3$Freq,decreasing = T),]
mow_F4 %>% head()
mow_F5 = mow_F4[-c(1:3,6,11,15,18,20,21,30),]

bokujo_F2 = subset(bokujo_freq, Info1 %in% c("形容詞","名詞"))
bokujo_F3 = subset(bokujo_F2, !Info2 %in% c("接尾","非自立","代名詞"))
bokujo_F4 = bokujo_F3[order(bokujo_F3$Freq,decreasing = T),]
bokujo_F4 %>% head()
bokujo_F5 = bokujo_F4[-c(1:3,7,11,13,15,16,22,30),]

supercup_F2 = subset(supercup_freq, Info1 %in% c("形容詞","名詞"))
supercup_F3 = subset(supercup_F2, !Info2 %in% c("接尾","非自立","代名詞"))
supercup_F4 = supercup_F3[order(supercup_F3$Freq,decreasing = T),]
supercup_F4 %>% head()
supercup_F5 = supercup_F4[-c(1,2,4,6,9,14,16,18,22,26),]


##グラフ
haagen_F5 %>%
  filter(Freq >=20) %>%
  mutate(Term = reorder(Term,Freq)) %>%
  ggplot(aes(Term,Freq)) +
  geom_col(fill = "lightgreen") +
  coord_flip() +
  ggtitle("ハーゲンダッツ　頻出語")

so_F5 %>%
  filter(Freq >=20) %>%
  mutate(Term = reorder(Term,Freq)) %>%
  ggplot(aes(Term,Freq)) +
  geom_col(fill = "lightgreen") +
  coord_flip() +
  ggtitle("爽　頻出語")

mow_F5 %>%
  filter(Freq >=25) %>%
  mutate(Term = reorder(Term,Freq)) %>%
  ggplot(aes(Term,Freq)) +
  geom_col(fill = "lightgreen") +
  coord_flip() +
  ggtitle("MOW　頻出語")

bokujo_F5 %>%
  filter(Freq >=15) %>%
  mutate(Term = reorder(Term,Freq)) %>%
  ggplot(aes(Term,Freq)) +
  geom_col(fill = "lightgreen") +
  coord_flip() +
  ggtitle("牧場しぼり　頻出語")

supercup_F5 %>%
  filter(Freq >=30) %>%
  mutate(Term = reorder(Term,Freq)) %>%
  ggplot(aes(Term,Freq)) +
  geom_col(fill = "lightgreen") +
  coord_flip() +
  ggtitle("スーパーカップ　頻出語")
