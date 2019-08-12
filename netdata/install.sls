{% if grains['os'] == 'Ubuntu' %}

netdata-prereqs:
  pkg.installed:
    - pkgs:
      - zlib1g-dev
      - uuid-dev
      - libuv1-dev
      - liblz4-dev
      - libjudy-dev
      - libssl-dev
      - libmnl-dev
      - gcc
      - make
      - git
      - autoconf
      - autoconf-archive
      - autogen
      - automake
      - pkg-config
      - curl
      - python

{% elif grains['os'] == 'CentOS' %}

netdata-prereqs:
  pkg.installed:
    - pkgs:
      - autoconf
      - automake
      - curl
      - gcc
      - git
      - libmnl-devel
      - libuuid-devel
      - openssl-devel
      - libuv-devel
      - lz4-devel
      - Judy-devel
      - make
      - nmap-ncat
      - pkgconfig
      - python
      - zlib-devel

{% elif grains['os'] == 'Fedora' %}

netdata-prereqs:
  pkg.installed:
    - pkgs:
      - zlib-devel
      - libuuid-devel
      - libuv-devel
      - lz4-devel
      - Judy-devel
      - openssl-devel
      - libmnl-devel
      - gcc
      - make
      - git
      - autoconf
      - autoc-nf-marchive
      - autogen
      - automake
      - pkgconfig
      - curl
      - findutils
      - python

{% endif %}

netdata-repo:
  git.latest:
    - name: https://github.com/netdata/netdata.git
    - rev: master
    - depth: 100
    - target: /tmp/netdata

netdata-install:
  cmd.run:
    - name: /tmp/netdata/netdata-installer.sh --dont-start-it --dont-wait
    - cwd: /tmp/netdata
    - require:
      - git: netdata-repo
      - pkg: netdata-prereqs
