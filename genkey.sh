#!/usr/bin/bash

soundnessup install
soundnessup update
soundness-cli generate-key --name my-key
soundness-cli export-key --name my-key

cat /key_store.json