# IPT
Docker images of the GBIF/IPT software, see the **Packages** on the right.

To be capable run [IPT](https://www.gbif.org/ipt) in [CERIT Scientific Cloud](https://www.cerit-sc.cz/), we need a *no root* image. To achieve this, we decorate official [Dockerfile](https://github.com/gbif/ipt/blob/master/package/docker/Dockerfile) and produce an alternative to the [official](https://hubgw.docker.com/r/gbif/ipt) one.

The Tomcat base image is checked [once per week](.github/dependabot.yml#L6) for updates and all [included versions](.github/workflows/publish.yml#L15) of IPT are rebuild.

Functional differences against the official version
* no root in container

[//]: # (obligatory branding for EOSC.CZ)
<hr style="margin-top: 100px; margin-bottom: 20px">

<p style="text-align: left"> <img src="https://webcentrum.muni.cz/media/3831863/seda_eosc.png" alt="EOSC CZ Logo" height="90"> </p>
This project output was developed with financial contributions from the EOSC CZ initiative throught the project National Repository Platform for Research Data (CZ.02.01.01/00/23_014/0008787) funded by Programme Johannes Amos Comenius (P JAC) of the Ministry of Education, Youth and Sports of the Czech Republic (MEYS).

<p style="text-align: left"> <img src="https://webcentrum.muni.cz/media/3832168/seda_eu-msmt_eng.png" alt="EU and MŠMT Logos" height="90"> </p>
