FROM ubuntu:bionic
MAINTAINER Fmstrat <fmstrat@NOSPAM.NO>

ENV DEBIAN_FRONTEND noninteractive

# Install all apps
# The third line is for multi-site config (ping is for testing later)
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y pkg-config \
    && apt-get install -y attr \
                       acl \
                       samba \
                       smbclient \
                       ldap-utils \
                       winbind \
                       libnss-winbind \
                       libpam-winbind \
                       krb5-user \
                       krb5-kdc \
                       gosu \
                       supervisor \
    && apt-get install -y inetutils-ping \
#                      openvpn
#clear cache - save some disk space
    && rm -rf /var/cache/apt /var/lib/apt/lists


# Set up script and run
COPY init.sh /init.sh
RUN chmod 755 /init.sh
CMD /init.sh setup
