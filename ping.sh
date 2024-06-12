#!/bin/sh
near transaction construct-transaction olga.statelessnet olga.pool.statelessnet add-action function-call ping json-args {} prepaid-gas '100.0 Tgas' attached-deposit '0 NEAR' skip network-config statelessnet sign-with-legacy-keychain send
