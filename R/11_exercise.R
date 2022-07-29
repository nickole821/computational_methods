### Exercise in group, 28/07
### By: Nicole, Julia and Kauê

# Packages required
library(vegan)
library(dplyr)

# Input

tabela <- read.csv("data/raw/cestes/comm.csv", sep = ",", head = T)

# Question 1

soma_abundancia <- colSums(tabela[,2:57]) # Essa função soma os valores presentes em uma coluna
abundancia_ordenada <- sort(soma_abundancia, decreasing = T)
abundancia_ordenada[c(1:5)] # O resultado são as 5 espécies mais diversas

# Question 2

tabela[,1] <- as.character(tabela[,1]) # Para transformar os sites em um nome, e não em número - caso contrário, eles seriam substituídos na próxima função
tabela_01 <- tabela %>% mutate_if(is.numeric, ~1 * (. != 0)) # Para substituir todos os valores >1 em 1
riqueza_sites <- rowSums(tabela_01[,2:57]) # Essa função soma os valores presentes nas linhas - quantas espécies têm por site
sites <- tabela_01[,1]
tabela_riqueza <- data.frame(sites, riqueza_sites) # Criei uma tabela para apresentar os resultados
names(tabela_riqueza)[2] <- "Riqueza"
names(tabela_riqueza)[1] <- "Site"

tabela_riqueza

# Question 3

especie_mais_abundante <- max.col(tabela[,2:57]) # Essa função dá a posição na tabela da espécie mais abundante. Coincidentemente, a posição coincide com o número da espécie
tabela_abundancia <- data.frame(sites, especie_mais_abundante)
names(tabela_abundancia)[2] <- "Espécie mais abundante"
names(tabela_abundancia)[1] <- "Site"

tabela_abundancia

# Question 4

### Shannon diversity index

shannon_sites = c()

for(i in seq(1,nrow(tabela))){
  temp_diversity_shannon <- diversity(tabela[i,2:57], index = "shannon")
  shannon_sites <- append(shannon_sites, temp_diversity_shannon)
}

tabela_shannon <- data.frame(sites, shannon_sites)
names(tabela_shannon)[2] <- "Shannon Diversity Index"
names(tabela_shannon)[1] <- "Site"

tabela_shannon

### Simpson's diversity index

simpson_sites = c()

for(i in seq(1,nrow(tabela))){
  temp_diversity_simpson <- diversity(tabela[i,2:57], index = "simpson")
  simpson_sites <- append(simpson_sites, temp_diversity_simpson)
}

tabela_simpson <- data.frame(sites, simpson_sites)
names(tabela_simpson)[2] <- "Simpson's Diversity Index"
names(tabela_simpson)[1] <- "Site"

tabela_simpson

### Inverse Simpson

invsimpson_sites = c()

for(i in seq(1,nrow(tabela))){
  temp_diversity_invsimpson <- diversity(tabela[i,2:57], index = "invsimpson")
  invsimpson_sites <- append(invsimpson_sites, temp_diversity_invsimpson)
}

tabela_invsimpson <- data.frame(sites, invsimpson_sites)
names(tabela_invsimpson)[2] <- "Inverse Simpson's Diversity Index"
names(tabela_invsimpson)[1] <- "Site"

tabela_invsimpson
