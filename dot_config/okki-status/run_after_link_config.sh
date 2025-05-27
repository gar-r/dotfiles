#!/bin/sh

cfg="arcanist"
if [[ "$HOSTNAME" == "rog" ]]; then
    cfg="rog"
fi

ln -sf config-$cfg.yaml config.yaml
