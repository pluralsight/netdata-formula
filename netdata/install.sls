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
      - nc
      - pkgconfig
      - python
      - zlib-devel

netdata-repo:
  git.latest:
    - name: https://github.com/netdata/netdata.git
    - depth: 100
    - target: /tmp/netdata

netdata-install:
  cmd.run:
    - name: /tmp/netdata/netdata-installer.sh --dont-start-it --dont-wait
    - cwd: /tmp/netdata
    - require:
      - git: netdata-repo
      - pkg: netdata-prereqs
