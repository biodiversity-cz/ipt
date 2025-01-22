# IPT
Docker images of the GBIF/IPT software, see the **Packages** on the right.

To be capable run [IPT](https://www.gbif.org/ipt) in [CERIT Scientific Cloud](https://www.cerit-sc.cz/), we need a *no root* image. To achieve this, we decorate official [Dockerfile](https://github.com/gbif/ipt/blob/master/package/docker/Dockerfile) and produce an alternative to the [official](https://hubgw.docker.com/r/gbif/ipt) one.

The Tomcat base image is checked [once per week](.github/dependabot.yml#L6) for updates and all [included versions](.github/workflows/publish.yml#L15) of IPT are rebuild.

Functional differences against the official version
* no root in container 