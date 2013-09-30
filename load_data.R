# This file needs to load:
  # Andrena bee community data in `sites; sp; ...` format
    # those are restricted to a geografical area, but not effort or timing of collection
  # Andrena traits, specially phenology and oligolecty
  # Will will add the phylogeny too.
  # Not sure what will happen next.

#questions: 
  #sampling is oportunistic, which means detecting a species means it's present for sure,
      #but non detecting a species is a dubious absence. Effort is not equal among colection events.
      #so using 0/1 is tricky, but using abundances would imply rarefy to same number of individuals?
  # Is the rest of the community important? that is, should we include total bee richness/abundance?
      #I included all specimens, and we can easily pull total richness per site.
  # Is habitat important? can habitat modulate the coexistance of some species pairs? I can get GIS, I guess.
  #is spatial auocorrelation important? 


##load libraries----
library(fields)
library(raster)


##load and explore the data----

dat <- read.table("data/data_master.txt", header = TRUE) #note data not in Github!
str(dat) #84771 specimens (most to species level)
length(unique(dat$col_event)) #1900 collection events (communities > 10 specimens)
  #those are oportunistic, usually using pan traps.

#See geografical coverage
plot(dat[,c("longitude","latitude")], pch=20, col = "grey", las = 1)
US(add=TRUE)

table(dat$genus) #my initial idea is restrict that to Andrena species, because are very similar, 
                 #expcept for size, diet and phenology. 
                 #I am afraid that mixing Genus will be too confusing as behaviours are really different
andrena <- subset(dat, genus == "Andrena")
str(andrena) #still 10199 specimens
andrena <- droplevels(andrena)
length(unique(andrena$col_event)) #and 574 colection events

#the phylogeny should include the following species, then:
table(andrena$gen_sp) #but maybe we should focus on the common ones?

#I will disregard other variables for now.
  # year, jday and jday_end gives the date of collection in days since 1 Jan (and end day)
  # id, method, notes, other geografical information (and its accuracy) will help track issues
  # habitat can be cool to add, but needs cleaning/extra GIS work. 
      #Can habitat relax competition and allow coexistance?

#Traits (not done yet):

# I have very good body size metric (continous), 
# phenology for most of the common ones (continous): start date, finish date and duration.
# Oligolecty (categorical), but if interesting I think I can do continous by calculating
    #phylogenetic distance of plants visited.
# Other typical traits are meaningless, as all nests on the ground and are solitary.




