
######################################
# target
######################################
TARGET = Main

#######################################
# paths
#######################################
# Build path
BUILD_DIR = bin
SRC_GEN = src-gen
INCL = include

#######################################
# clean up
#######################################
clean: 
	-rm -fR $(SRC_GEN)
	-rm -fR $(BUILD_DIR)
	-rm -fR $(INCL)


#######################################
# run everything
#######################################
build_dev:
	lfc-dev src/Main.lf

build:
	lfc src/Main.lf

#######################################
# run everything
#######################################
build_test:
	-rm -fR src-gen/Main/build
	cd src-gen/Main && cmake . -Bbuild
	cd src-gen/Main/build && make
