#!/bin/sh

mount -t tmpfs cgroup_root /sys/fs/cgroup
mkdir /sys/fs/cgroup/dsid
mount -t cgroup -o dsid dsid /sys/fs/cgroup/dsid
mkdir /sys/fs/cgroup/dsid/test-1 /sys/fs/cgroup/dsid/test-2
