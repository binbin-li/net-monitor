#!/bin/bash
# Exit on Errors
set -e

# truncate a version to the first 6 characters.
VERSION=${SHA::6}

# set default PROJECT directory unless supplied
: ${PROJECT_DIR:=./src/$PROJECT_NAME}

# set a default PUBLISH directory unless supplied.
: ${PUBLISH_DIR:=$PROJECT_DIR}

msft-sbom generate \
-b $PROJECT_DIR \
-bc $PUBLISH_DIR \
-di $IMAGE \
-m $SBOM_DIR \
-nsb http://sssc.platforms-cse.com \
-nsu $PROJECT_NAME \
-pn $PIPELINE.$PROJECT_NAME \
-pv $VERSION


cp $SBOM_DIR/_manifest/spdx_2.2/manifest.spdx.json $SBOM_DIR/$PROJECT_NAME.spdx.json