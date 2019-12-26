#!/bin/bash

vault secrets enable kv
vault kv enable-versioning kv/my-secret
consul snapshot save backup-v0.snap