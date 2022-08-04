# --------------------------------------------------#
# Scientific computing
# ICTP/Serrapilheira 2022
# Applying diversity metrics to cestes files
# --------------------------------------------------#

comm <- read.csv("data/raw/cestes/comm.csv", sep = ",", head = T)
coord <- read.csv("data/raw/cestes/coord.csv", sep = ",", head = T)
envir <- read.csv("data/raw/cestes/envir.csv", sep = ",", head = T)
sp_list <- read.csv("data/raw/cestes/splist.csv", sep = ",", head = T)
traits <- read.csv("data/raw/cestes/traits.csv", sep = ",", head = T)

head(comm)[,1:6]
head(traits)[,1:6]
rownames(comm)[1:6]

rownames(comm) <- paste0("Site", comm[,1])
rownames(traits) <- traits$Sp
comm <- comm[,-1]
traits <- traits[,-1]
head(comm)[,1:6]
head(traits)[,1:6]

# Species richness can be calculated with the vegan package:

library(vegan)
richness <- vegan::specnumber(comm)

# Taxonomic measures can be calculated using diversity() function:

shannon <- vegan::diversity(comm)
simpson <- vegan::diversity(comm, index = "simpson")

# Gower distance is a common distance metric used in trait-based ecology.

library(cluster)
library(FD)
gow <- cluster::daisy(traits, metric = "gower")
gow2 <- FD::gowdis(traits)
#implementations in R vary and the literature reports extensions and modifications
identical(gow, gow2) #not the same but why?

class(gow) #different classes
class(gow2)
plot(gow, gow2, asp = 1) #same values

# Using package SYNCSA
library(SYNCSA)
tax <- rao.diversity(comm)
fun <- rao.diversity(comm, traits = traits)
plot(fun$Simpson,fun$FunRao, pch = 19, asp = 1)
abline(a = 0, b = 1)

library(FD)
#we can use the distance matrix to calculate functional diversity indices
FuncDiv1 <- dbFD(x = gow, a = comm, messages = F)
#the returned object has Villéger's indices and Rao calculation
names(FuncDiv1)

#We can also do the calculation using the traits matrix directly
FuncDiv <- dbFD(x = traits, a = comm, messages = F)



library(taxize)
classification_data <- classification(sp_list$TaxonName, db = "ncbi")
str(classification)
length(classification_data)

classification_data$"Arisarum vulgare"
classification_data[[1]]
classification_data[[4]]

library(dplyr)
table_ex <- classification_data[[1]] %>%
  filter(rank == "family") %>%
  select(name)

extract_family <- function(x) {
  x %>%
  filter(rank == "family") %>%
  select(name)
}

families <- list()
for (i in 1:length(classification_data)) {
  families[[i]] <- xxxxxxx
}
