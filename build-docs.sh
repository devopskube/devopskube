#!/bin/bash
#
# We are generating the documentation from given markdown-files using mkdoc (see
# http://www.mkdocs.org/).
# To be able to components in their corresponding helm-charts directory, we are
# copying the README.md files out of these directories into the components-directory.
#
MKDOC_COMP_PATH=docs/components

echo "Going to Build documentation..."

while [[ $# -gt 0 ]]
do
  key="$1"

  echo "KEY: $key"

  case $key in
      -b|--build)
        COPY=true
        BUILD=true
        shift
        ;;
      -c|--copy)
        COPY=true
        shift
        ;;
      -d|--deploy)
        COPY=true
        DEPLOY=true
        shift
        ;;
      -s|--serve)
        echo "Serving Documentation"
        COPY=true
        SERVE=true
        shift
        ;;
      *)
        echo "-b|-c|-d|-s"
        # unknown option
        ;;
  esac
  shift
done

if [[ "$COPY" ]]; then
  find charts -maxdepth 2 -type f -name "README.md" -print0 | while read -d $'\0' readme
  do
    cp $readme $MKDOC_COMP_PATH/$(basename $(dirname $readme)).md
  done
fi

if [[ "$BUILD" ]]; then
  mkdocs build --clean
fi

if [[ "$DEPLOY" ]]; then
  mkdocs gh-deploy --clean
fi

if [[ "$SERVE" ]]; then
  mkdocs serve
fi
