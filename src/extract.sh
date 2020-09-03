#!/bin/bash

# This bash script assumes that models are present in subfolder named 'models'
# Output files will be written to ecfiles, containing a list of unique ec numbers for each model
while read model; do
    # Make sure ecfiles folder exists
    mkdir -p ecfiles
    # n.b. Grep expression is hardcoded for Daniel's EMBL GEMs https://github.com/cdanielmachado/embl_gems
    # n.b. Any E.C. numbers with missing fields (i.e. 2.3.1.-) will be removed
    less models/$model|
        grep 'EC Number'| \
        sed 's/^.*: //g'| \
        sed 's/<.*$//g'| \
        sed '/-/d'|sed '/N\/A/d' | \
        sort|uniq \
    > ecfiles/$model.ec
    # Output number of unque ec numbers
    echo -ne "Reading E.C. numbers in model $model, unique E.C. : "
    ECNUM=$(less ecfiles/$model.ec|wc -l)
    echo $ECNUM
done< <(ls models)
