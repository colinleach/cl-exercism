#!/usr/bin/env bash

(( $1 % 3 )) && pling="" || pling="Pling"
(( $1 % 5 )) && plang="" || plang="Plang"
(( $1 % 7 )) && plong="" || plong="Plong"

resp="$pling$plang$plong"
[[ ! $resp ]] && echo $1 || echo $resp
