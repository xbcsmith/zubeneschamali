#!/bin/bash

NAME=$(basename $(pwd))
TIMESTAMP=$(date -R -u)
VERSIONS="1.0.0"
#VERSIONS="${VERSIONS} 1.0.1"
#VERSIONS="${VERSIONS} 1.0.2 1.0.3 1.1.0"

# Sometimes we want to build the same package
# with assending build numbers
# Uncomment to increment builds
#VERSIONS="${VERSIONS} 1.0.0 1.0.0 1.0.0"

BUILD=1

for VERSION in $VERSIONS;do
    # Uncomment to increment build number
    #BUILD=$((BUILD + 1))
    mkdir ${NAME}-${VERSION}
    cp -av debian ${NAME}-${VERSION}/
    cp -v src/* ${NAME}-${VERSION}/
    sed -i "s/@VERSION@/${VERSION}-${BUILD}/g" ${NAME}-${VERSION}/debian/changelog
    sed -i "s/@TIMESTAMP@/$TIMESTAMP/g" ${NAME}-${VERSION}/debian/changelog
    tar -zcvf ${NAME}-${VERSION}.tgz ${NAME}-${VERSION}/
    ln -sf ${NAME}-${VERSION}.tgz ${NAME}_${VERSION}.orig.tar.gz
    pushd ${NAME}-${VERSION}
      debuild -S -uc -us
      debuild -i -uc -us -b
    popd
    tar -cvf ${NAME}_${VERSION}-${BUILD}.tar ${NAME}_${VERSION}-${BUILD}.debian.tar.*z ${NAME}-${VERSION}.tgz ${NAME}_${VERSION}.orig.tar.gz ${NAME}_${VERSION}-${BUILD}.dsc
    rm -rf ${NAME}-${VERSION}
done
