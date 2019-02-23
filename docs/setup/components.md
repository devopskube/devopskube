# Setup Components

## Install 

To install the components, which are part of devopskube, we do provide the install-private.sh script 
in the charts directory. This script uses the provided values.yaml files in each component folder. If
a file values.private.yaml is provided in the components folder, the values from this file overrides the
values in the existing values.yaml. The functionality behind this is described in the 
[Helm Documentation](https://helm.sh/docs/helm/#helm-install).

## Makefile

In each component, a Makefile can be found. This file provides the following targets:

```
package
- build the component

dependencies:
- build and/or updates the dependencies of this component

bump:
- bumps the version of the component using bumpversion (a python tool) and tags the git repository and also pushes 
  the tag to the remote repository
```

## Version bump

For the Versioning of components, we do use ```bumpversion``` to allow for semantic versioning of components.

To install bumpversion, you can easily use the PyPi package bumpversion. The documentation for this tool can be found on 
[PyPi](https://pypi.org/project/bumpversion/) as well. The usual version increment used in the make target "bump" is patch, 
so that version 0.0.1 is incremented to 0.0.2.


To bump the minor or the major, one of the following commands should be used

```
bumpversion minor
bumpversion major
``` 

Please do not forget to push your changes and the tag to the remote repository after bumping the version.
