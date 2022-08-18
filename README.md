# FORKED

This is a fork from https://github.com/rancher/local-path-provisioner

# Why? 

One of the NFS vendors advised use that we were getting sub-optimal performance by using
~1k NFS connections; they wanted us to go to 1 NFS 4.1 connection per export per machine. 

In looking around, I was unable to find any CSI provisioner that:
- use a local path for a PVC
- _AND_ doesn't add topology awareness. 

# Solution

The beauty of Rancher's local-path provisioner is light weight and was trivial to make
what I needed. 

# Can I use it? 

Sure.

# Deployment

To deploy this hack version:
1. Tweak deploy/shared-deployment.yaml to make sure that the path is correct
1. Run `kubectl apply -f deploy/shared-deployment.yaml`

# Images

Yup, go to https://github.com/darkmuggle/shared-local-path-provisioner/pkgs/container/shared-local-path
