##•ªÍ‘ÎÛ‚Ì“à–ó•Ò

haagen_age = html_nodes(haagen_rink_star,".age") %>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

so_age = html_nodes(so_rink_star,".age") %>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

mow_age = html_nodes(mow_rink_star,".age") %>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

bokujo_age = html_nodes(bokujo_rink_star,".age") %>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

supercup_age = html_nodes(supercup_rink_star,".age") %>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

length(grep("—«",supercup_age))
length(grep("’j«",supercup_age))
length(grep("10‘ã",supercup_age))
length(grep("20‘ã",supercup_age))
length(grep("30‘ã",supercup_age))
length(grep("40‘ã",supercup_age))
length(grep("50‘ã",supercup_age))
length(grep("60‘ã",supercup_age))
length(grep("70‘ã",supercup_age))
length(grep("-",supercup_age))


