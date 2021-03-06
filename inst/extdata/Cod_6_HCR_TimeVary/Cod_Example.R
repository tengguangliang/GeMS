library(GeMS)

#==Assumes your working directory is set to where the control file is located.

CTLNameList<-c("Cod_Base","Cod_F35","Cod_F35_Slope","Cod_LenComp","Cod_EM","Cod_EM_LenComp")

#==Loop that reads in CTL files stored in MSEdir and executes code in sequence
#run_GeMS(CTLNameList=CTLNameList)

#==Loop that reads in CTL files stored in MSEdir and executes code in parallel
 run_GeMS(CTLNameList=CTLNameList,
          runparallel=T, cores=6)

##==compare just two scenarios: estimating M vs. not estimating M when M is varying
 Inout<-ReadCTLfile(CTLNameList[1])
 AgeStructureComp(out=Inout,CTLNameList=CTLNameList[1:3],MSEdir=getwd(),Nruns=20,
 					plotNames=c("Constant Catch","F35","Sloped F35"))


##==compare just two scenarios: estimating M vs. not estimating M when M is varying
 Inout<-out<-ReadCTLfile(CTLNameList[2])
 AgeStructureComp(out=Inout,CTLNameList=CTLNameList[c(2,5,6)],MSEdir=getwd(),Nruns=20,
 					plotNames=c("Fixed L50","Vary L50","Better Fut. Data"))
