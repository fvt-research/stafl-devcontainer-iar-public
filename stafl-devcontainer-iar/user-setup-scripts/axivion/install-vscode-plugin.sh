#!/bin/bash

code --install-extension $(find /opt/bauhaus-suite/doc/VSCodePlugin/ -maxdepth 1 -name 'Axivion.VSCodePlugin-*.vsix' -print -quit)
