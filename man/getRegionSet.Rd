% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadRegionDB.R
\name{getRegionSet}
\alias{getRegionSet}
\title{Grab a single region set from a database, specified by filename.}
\usage{
getRegionSet(regionDB, filenames, collections = NULL)
}
\arguments{
\item{regionDB}{A region database loaded with loadRegionDB().}

\item{filenames}{Filename(s) of a particular region set to grab.}

\item{collections}{(optional) subset of collections to list}
}
\value{
A GRanges object derived from the specified file in the regionDB.
}
\description{
If you want to work with a LOLA regionDB region set individually,
this function can help you. It can extract individual (or subsets of)
region sets from either loaded regionDBs, loaded with loadRegionDB(), or
from a database on disk, where only the region sets of interest will
be loaded.
}
\examples{
dbPath = system.file("extdata", "hg19", package="LOLA")
regionDB = loadRegionDB(dbLocation=dbPath)
data("sample_universe", package="LOLA")
data("sample_input", package="LOLA")

getRegionSet(regionDB, collections="ucsc_example", filenames="vistaEnhancers.bed")
getRegionSet(dbPath, collections="ucsc_example", filenames="vistaEnhancers.bed")
getRegionFile(dbPath, collections="ucsc_example", filenames="vistaEnhancers.bed")


res = runLOLA(userSets, userUniverse, regionDB, cores=1)
locResult = res[2,]
extractEnrichmentOverlaps(locResult, userSets, regionDB)
writeCombinedEnrichment(locResult, "temp_outfolder")

userSetsRedefined =	redefineUserSets(userSets, userUniverse)
resRedefined = runLOLA(userSetsRedefined, userUniverse, regionDB, cores=1)

g = plotTopLOLAEnrichments(resRedefined)

}
