##############################
## @Author : Deepak Tanwar  ##
## @Date :   20201005       ##
##############################

## MultiQC report of RNA-Seq data

all: task1
task1:
	multiqc --version > log && multiqc -d -f -i "MultiQC report for MSUS RNA-Seq data</b>" -b "<i>--by</i> <br> <b>Deepak Tanwar</b>" -c multiqc_config.yaml -o ./output -z -v ./input  2>> log
