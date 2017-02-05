PKGTITLE="ard"
PKGID=com.cgerke.ard
PKGVERSION="1.0"
TARGET=.

#################################################

##Help - Show this help menu
help: 
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

##  clean - Clean up temporary working directories
clean:
	rm -f ${TARGET}/${PKGTITLE}.pkg

##  pkg - Create a package using pkgbuild
pkg: clean
	pkgbuild --root pkgroot --scripts scripts --identifier ${PKGID} --version ${PKGVERSION} --ownership recommended ${TARGET}/${PKGTITLE}.pkg
