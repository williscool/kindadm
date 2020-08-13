# deploy-kubernetes-kind-docker4win

aka Docker Desktop aka Docker for Windows also probably works on Docker for Mac

Create a local one or multi-node K8s cluster in kind preset for development with one command.

## Demo

![gif](demo.gif)

## Quick Start

To create a local one or multi-node K8s cluster in that runs in Docker for Windows with properly configured Helm v3, Ingress Controller, MetalLB, and Metrics Server - please run:

```bash
cd local-cluster

# before you run check prerequisites-cmds.sh for commands things to have installed
# I don't yet recommend running the prereqs script because it doesn't check to se if you've installed already

# TODO this should just default to 3. 1 control plane and 2 workers
bash create-cluster.sh --nodes=[1-99] --k8s_ver=1.[x].[x]   # Only no. of K8s nodes is mandatory.
```
## Quirks

always run `create-cluster.sh` with a `kind-cfg.yaml` that has an empty `nodes:` key the bash script always appeneds and you can end up creating more nodes than you intend to

fixing this is a todo

## Helper Menu

```console
# bash create-cluster.sh -h

Usage:
    --k8s_ver,-v         Set K8s version to be deployed.
    --nodes,-n           Set number of K8s nodes to be created.
    --all-labelled,-al   Set labels on all K8s nodes.
    --half-labelled,-hl  Set labels on half K8s nodes.
    --all-tainted,-at    Set taints on all K8s nodes. A different label can be defined.
    --half-tainted,-ht   Set taints on half K8s nodes. A different label can be defined.
    --reset,-r           Resets any old temporary configuration.
    --help,-h            Prints this message.
Example:
    bash create-cluster.sh -n=2 -v=1.18.2 -hl='nodeType=devops' -ht
```

## Prerequisite Notes

1. Linux Docker container runtime (`docker.io` or `docker-ce` pkg depending on your OS).
2. `kubectl` binary.
3. `helm` binary.
4. Helm plugins: `helm-diff`.
5. `helmfile` binary.
6. `kind` binary.

`prerequisites-cmds.sh` downloads and installs the following software. please note the script does not check if these tools are already installed so read it first and use with caution:

## NOTES on getting this to run in docker4win among other things

[NOTES.md](NOTES.md)

## Credits

Hello my name is [William Harris](https://will.vc/). A software engineer / consultant based in the US.

This would not be possible without the repo for which this is a fork is [Miroslav Hadzhiev's](https://www.linkedin.com/in/mehadzhiev/) - check it out at https://github.com/Xtigyro/deploy-kubernetes-kind/

## License

GNU General Public License v2.0
