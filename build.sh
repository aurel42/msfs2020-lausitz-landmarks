#!/bin/bash

PATH=$PATH:/mnt/c/MSFStk

case "$1" in
    cleanonly)
	rm -rfv Temp Output
	exit
	;;
    clean*)
	rm -rfv Temp Output
	;;
esac

# CB-altmarkt-sprem
powershell.exe msfs elev -border '.\Sources\cb-altmarkt-sprem.shp' -imagery '.\Sources\dem\cb-altmarkt.tif' -res 2 -falloff 20 -priority 2 'PackageSources\mesh\mesh-cb-altmarkt.xml'

# CB-btu-ikmz
powershell.exe msfs elev -border '.\Sources\cb-btu-ikmz.shp' -imagery '.\Sources\dem\cb-altmarkt.tif' -res 1 -falloff 10 -priority 3 'PackageSources\mesh\mesh-cb-btu-ikmz.xml'

fspackagetool.exe -mirroring -nopause '.\charliebravo-scenery-lausitz.xml'
